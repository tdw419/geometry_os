; DESCRIPTION: Places a cyan line segment connecting (148, 123) to (466, 49).
; PLAN: r0=148(x1), r1=123(y1), r2=466(x2), r3=49(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 123
LDI r2, 466
LDI r3, 49
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
