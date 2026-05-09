; DESCRIPTION: Composite: Sets a single green pixel at (170, 86) then Places a red circle of radius 63 at center (375, 187) then Renders a orange box of size 88x109 starting at (365, 67).
; PLAN: r0=170(x), r1=86(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=375(x), r6=187(y), r7=63(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=365(x), r11=67(y), r12=88(width), r13=109(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 170
LDI r1, 86
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 375
LDI r6, 187
LDI r7, 63
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 365
LDI r11, 67
LDI r12, 88
LDI r13, 109
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
