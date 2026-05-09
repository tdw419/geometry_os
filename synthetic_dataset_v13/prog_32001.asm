; DESCRIPTION: Places a white line segment connecting (81, 20) to (412, 136).
; PLAN: r0=81(x1), r1=20(y1), r2=412(x2), r3=136(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 20
LDI r2, 412
LDI r3, 136
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
