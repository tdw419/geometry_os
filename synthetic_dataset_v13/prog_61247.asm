; DESCRIPTION: Places a yellow line segment connecting (34, 208) to (120, 180).
; PLAN: r0=34(x1), r1=208(y1), r2=120(x2), r3=180(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 208
LDI r2, 120
LDI r3, 180
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
