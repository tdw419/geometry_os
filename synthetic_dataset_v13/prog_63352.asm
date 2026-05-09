; DESCRIPTION: Places a cyan line segment connecting (323, 193) to (343, 126).
; PLAN: r0=323(x1), r1=193(y1), r2=343(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 193
LDI r2, 343
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
