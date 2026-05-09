; DESCRIPTION: Places a cyan line segment connecting (463, 6) to (477, 207).
; PLAN: r0=463(x1), r1=6(y1), r2=477(x2), r3=207(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 6
LDI r2, 477
LDI r3, 207
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
