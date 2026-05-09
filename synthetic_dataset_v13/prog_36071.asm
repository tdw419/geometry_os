; DESCRIPTION: Composite: Renders a red disk with center (132, 186) and radius 11 then Creates a purple rectangular region at (409, 32) spanning 75 by 84 pixels then Sets a single orange pixel at (230, 142).
; PLAN: r0=132(x), r1=186(y), r2=11(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=409(x), r6=32(y), r7=75(width), r8=84(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=230(x), r11=142(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 132
LDI r1, 186
LDI r2, 11
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 409
LDI r6, 32
LDI r7, 75
LDI r8, 84
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 230
LDI r11, 142
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
