; DESCRIPTION: Places a green line segment connecting (24, 113) to (35, 141).
; PLAN: r0=24(x1), r1=113(y1), r2=35(x2), r3=141(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 113
LDI r2, 35
LDI r3, 141
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
