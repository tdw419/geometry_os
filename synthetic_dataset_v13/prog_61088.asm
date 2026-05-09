; DESCRIPTION: Places a cyan line segment connecting (432, 189) to (469, 247).
; PLAN: r0=432(x1), r1=189(y1), r2=469(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 189
LDI r2, 469
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
