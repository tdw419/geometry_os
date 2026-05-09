; DESCRIPTION: Composite: Places a blue circle of radius 49 at center (291, 85) then Places a purple dot at position (118, 243) then Renders a blue box of size 115x107 starting at (363, 127).
; PLAN: r0=291(x), r1=85(y), r2=49(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=118(x), r6=243(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=363(x), r11=127(y), r12=115(width), r13=107(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 85
LDI r2, 49
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 118
LDI r6, 243
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 363
LDI r11, 127
LDI r12, 115
LDI r13, 107
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
