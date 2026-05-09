; DESCRIPTION: Places a cyan line segment connecting (361, 126) to (489, 233).
; PLAN: r0=361(x1), r1=126(y1), r2=489(x2), r3=233(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 126
LDI r2, 489
LDI r3, 233
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
