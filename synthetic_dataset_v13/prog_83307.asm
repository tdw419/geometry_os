; DESCRIPTION: Composite: Renders a orange line between points (327, 98) and (39, 123) then Sets a single yellow pixel at (466, 213).
; PLAN: r0=327(x1), r1=98(y1), r2=39(x2), r3=123(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=213(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 327
LDI r1, 98
LDI r2, 39
LDI r3, 123
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 213
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
