; DESCRIPTION: Composite: Renders a cyan line between points (451, 24) and (249, 26) then Sets a single orange pixel at (435, 125).
; PLAN: r0=451(x1), r1=24(y1), r2=249(x2), r3=26(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=435(x), r6=125(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 451
LDI r1, 24
LDI r2, 249
LDI r3, 26
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 435
LDI r6, 125
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
