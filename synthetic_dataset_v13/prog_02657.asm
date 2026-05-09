; DESCRIPTION: Places a cyan line segment connecting (158, 188) to (105, 136).
; PLAN: r0=158(x1), r1=188(y1), r2=105(x2), r3=136(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 188
LDI r2, 105
LDI r3, 136
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
