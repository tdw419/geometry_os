; DESCRIPTION: Places a cyan line segment connecting (361, 176) to (291, 157).
; PLAN: r0=361(x1), r1=176(y1), r2=291(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 176
LDI r2, 291
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
