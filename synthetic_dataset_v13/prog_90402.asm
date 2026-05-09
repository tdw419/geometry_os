; DESCRIPTION: Composite: Places a green circle of radius 43 at center (105, 178) then Sets a single red pixel at (60, 7) then Renders a orange box of size 100x96 starting at (57, 59).
; PLAN: r0=105(x), r1=178(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x), r6=7(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=57(x), r11=59(y), r12=100(width), r13=96(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 105
LDI r1, 178
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 7
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 57
LDI r11, 59
LDI r12, 100
LDI r13, 96
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
