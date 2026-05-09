; DESCRIPTION: Places a black line segment connecting (168, 200) to (25, 158).
; PLAN: r0=168(x1), r1=200(y1), r2=25(x2), r3=158(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 200
LDI r2, 25
LDI r3, 158
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
