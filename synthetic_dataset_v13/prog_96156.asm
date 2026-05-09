; DESCRIPTION: Places a cyan line segment connecting (36, 137) to (140, 76).
; PLAN: r0=36(x1), r1=137(y1), r2=140(x2), r3=76(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 137
LDI r2, 140
LDI r3, 76
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
