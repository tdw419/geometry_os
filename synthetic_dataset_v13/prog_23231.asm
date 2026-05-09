; DESCRIPTION: Places a yellow line segment connecting (363, 210) to (463, 162).
; PLAN: r0=363(x1), r1=210(y1), r2=463(x2), r3=162(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 210
LDI r2, 463
LDI r3, 162
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
