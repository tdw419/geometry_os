; DESCRIPTION: Composite: Draws a purple line from (367, 14) to (188, 5) then Draws a green circle centered at (321, 63) with radius 39.
; PLAN: r0=367(x1), r1=14(y1), r2=188(x2), r3=5(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=321(x), r6=63(y), r7=39(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 367
LDI r1, 14
LDI r2, 188
LDI r3, 5
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 321
LDI r6, 63
LDI r7, 39
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
