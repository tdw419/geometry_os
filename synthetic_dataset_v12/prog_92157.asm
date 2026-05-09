; DESCRIPTION: Composite: Renders a cyan line between points (30, 71) and (143, 180) then Sets a single cyan pixel at (59, 109).
; PLAN: r0=30(x1), r1=71(y1), r2=143(x2), r3=180(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=59(x), r6=109(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 30
LDI r1, 71
LDI r2, 143
LDI r3, 180
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 59
LDI r6, 109
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
