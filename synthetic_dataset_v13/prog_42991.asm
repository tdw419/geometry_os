; DESCRIPTION: Places a blue line segment connecting (463, 111) to (336, 167).
; PLAN: r0=463(x1), r1=111(y1), r2=336(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 111
LDI r2, 336
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
