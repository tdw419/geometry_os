; DESCRIPTION: Composite: Places a purple circle of radius 40 at center (219, 69) then Places a red dot at position (344, 212) then Renders a yellow box of size 19x112 starting at (126, 69).
; PLAN: r0=219(x), r1=69(y), r2=40(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=344(x), r6=212(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=126(x), r11=69(y), r12=19(width), r13=112(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 219
LDI r1, 69
LDI r2, 40
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 344
LDI r6, 212
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 126
LDI r11, 69
LDI r12, 19
LDI r13, 112
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
