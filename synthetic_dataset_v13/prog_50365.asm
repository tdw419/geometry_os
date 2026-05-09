; DESCRIPTION: Composite: Places a red dot at position (407, 237) then Renders a orange box of size 88x54 starting at (240, 151) then Renders a red disk with center (72, 67) and radius 38.
; PLAN: r0=407(x), r1=237(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=240(x), r6=151(y), r7=88(width), r8=54(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=72(x), r11=67(y), r12=38(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 407
LDI r1, 237
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 240
LDI r6, 151
LDI r7, 88
LDI r8, 54
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 72
LDI r11, 67
LDI r12, 38
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
