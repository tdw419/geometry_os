; DESCRIPTION: Places a green line segment connecting (54, 31) to (511, 45).
; PLAN: r0=54(x1), r1=31(y1), r2=511(x2), r3=45(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 31
LDI r2, 511
LDI r3, 45
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
