; DESCRIPTION: Composite: Places a red circle of radius 24 at center (153, 77) then Places a red dot at position (279, 122) then Renders a purple box of size 77x85 starting at (88, 145).
; PLAN: r0=153(x), r1=77(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=279(x), r6=122(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=88(x), r11=145(y), r12=77(width), r13=85(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 153
LDI r1, 77
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 279
LDI r6, 122
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 88
LDI r11, 145
LDI r12, 77
LDI r13, 85
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
