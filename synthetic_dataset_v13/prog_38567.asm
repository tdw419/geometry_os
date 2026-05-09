; DESCRIPTION: Composite: Draws a blue line from (324, 4) to (192, 75) then Sets a single orange pixel at (400, 184).
; PLAN: r0=324(x1), r1=4(y1), r2=192(x2), r3=75(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=400(x), r6=184(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 324
LDI r1, 4
LDI r2, 192
LDI r3, 75
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 400
LDI r6, 184
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
