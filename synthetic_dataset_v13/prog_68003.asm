; DESCRIPTION: Places a green line segment connecting (167, 35) to (463, 19).
; PLAN: r0=167(x1), r1=35(y1), r2=463(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 35
LDI r2, 463
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
