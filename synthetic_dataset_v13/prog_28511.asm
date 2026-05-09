; DESCRIPTION: Places a cyan line segment connecting (463, 192) to (241, 148).
; PLAN: r0=463(x1), r1=192(y1), r2=241(x2), r3=148(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 192
LDI r2, 241
LDI r3, 148
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
