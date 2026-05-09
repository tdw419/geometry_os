; DESCRIPTION: Places a green line segment connecting (22, 150) to (265, 136).
; PLAN: r0=22(x1), r1=150(y1), r2=265(x2), r3=136(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 150
LDI r2, 265
LDI r3, 136
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
