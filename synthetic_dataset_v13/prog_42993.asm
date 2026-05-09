; DESCRIPTION: Composite: Renders a white line between points (42, 64) and (325, 120) then Sets a single cyan pixel at (458, 6).
; PLAN: r0=42(x1), r1=64(y1), r2=325(x2), r3=120(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=458(x), r6=6(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 42
LDI r1, 64
LDI r2, 325
LDI r3, 120
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 458
LDI r6, 6
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
