; DESCRIPTION: Composite: Renders a green disk with center (100, 108) and radius 72 then Creates a magenta rectangular region at (195, 72) spanning 118 by 36 pixels then Places a purple dot at position (216, 145).
; PLAN: r0=100(x), r1=108(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=195(x), r6=72(y), r7=118(width), r8=36(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=216(x), r11=145(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 100
LDI r1, 108
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 195
LDI r6, 72
LDI r7, 118
LDI r8, 36
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 145
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
