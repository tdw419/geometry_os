; DESCRIPTION: Places a yellow line segment connecting (206, 88) to (260, 159).
; PLAN: r0=206(x1), r1=88(y1), r2=260(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 88
LDI r2, 260
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
