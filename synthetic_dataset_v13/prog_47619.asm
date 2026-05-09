; DESCRIPTION: Composite: Draws a cyan line from (373, 74) to (458, 172) then Sets a single green pixel at (269, 28).
; PLAN: r0=373(x1), r1=74(y1), r2=458(x2), r3=172(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=269(x), r6=28(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 373
LDI r1, 74
LDI r2, 458
LDI r3, 172
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 28
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
