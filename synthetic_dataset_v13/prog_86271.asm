; DESCRIPTION: Composite: Places a magenta line segment connecting (228, 179) to (344, 166) then Sets a single green pixel at (119, 180).
; PLAN: r0=228(x1), r1=179(y1), r2=344(x2), r3=166(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=119(x), r6=180(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 228
LDI r1, 179
LDI r2, 344
LDI r3, 166
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 119
LDI r6, 180
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
