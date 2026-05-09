; DESCRIPTION: Composite: Places a purple line segment connecting (73, 85) to (413, 179) then Places a cyan dot at position (175, 42).
; PLAN: r0=73(x1), r1=85(y1), r2=413(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=175(x), r6=42(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 73
LDI r1, 85
LDI r2, 413
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 175
LDI r6, 42
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
