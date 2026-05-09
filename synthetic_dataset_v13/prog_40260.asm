; DESCRIPTION: Composite: Places a purple circle of radius 68 at center (183, 166) then Draws a orange line from (388, 196) to (312, 118) then Places a green dot at position (487, 169).
; PLAN: r0=183(x), r1=166(y), r2=68(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=388(x1), r6=196(y1), r7=312(x2), r8=118(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=487(x), r11=169(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 183
LDI r1, 166
LDI r2, 68
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 388
LDI r6, 196
LDI r7, 312
LDI r8, 118
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 487
LDI r11, 169
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
