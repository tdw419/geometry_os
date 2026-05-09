; DESCRIPTION: Composite: Places a cyan line segment connecting (45, 158) to (45, 227) then Places a red dot at position (429, 216).
; PLAN: r0=45(x1), r1=158(y1), r2=45(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=429(x), r6=216(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 45
LDI r1, 158
LDI r2, 45
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 429
LDI r6, 216
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
