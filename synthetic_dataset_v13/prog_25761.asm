; DESCRIPTION: Composite: Renders a yellow line between points (349, 209) and (98, 142) then Sets a single orange pixel at (288, 155).
; PLAN: r0=349(x1), r1=209(y1), r2=98(x2), r3=142(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=288(x), r6=155(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 349
LDI r1, 209
LDI r2, 98
LDI r3, 142
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 155
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
