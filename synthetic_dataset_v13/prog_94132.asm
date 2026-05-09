; DESCRIPTION: Composite: Draws a purple circle centered at (417, 31) with radius 14 then Draws a cyan line from (155, 222) to (265, 152).
; PLAN: r0=417(x), r1=31(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=155(x1), r6=222(y1), r7=265(x2), r8=152(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 417
LDI r1, 31
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 155
LDI r6, 222
LDI r7, 265
LDI r8, 152
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
