; DESCRIPTION: Composite: Renders a red line between points (19, 149) and (111, 140) then Sets a single cyan pixel at (348, 167).
; PLAN: r0=19(x1), r1=149(y1), r2=111(x2), r3=140(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=348(x), r6=167(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 19
LDI r1, 149
LDI r2, 111
LDI r3, 140
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 167
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
