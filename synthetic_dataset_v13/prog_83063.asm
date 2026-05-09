; DESCRIPTION: Composite: Renders a green line between points (181, 201) and (176, 130) then Sets a single orange pixel at (502, 230).
; PLAN: r0=181(x1), r1=201(y1), r2=176(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=502(x), r6=230(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 181
LDI r1, 201
LDI r2, 176
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 502
LDI r6, 230
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
