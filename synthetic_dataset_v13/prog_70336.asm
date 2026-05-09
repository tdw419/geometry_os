; DESCRIPTION: Places a green line segment connecting (273, 124) to (471, 49).
; PLAN: r0=273(x1), r1=124(y1), r2=471(x2), r3=49(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 124
LDI r2, 471
LDI r3, 49
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
