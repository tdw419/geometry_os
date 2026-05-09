; DESCRIPTION: Places a blue line segment connecting (60, 196) to (153, 180).
; PLAN: r0=60(x1), r1=196(y1), r2=153(x2), r3=180(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 196
LDI r2, 153
LDI r3, 180
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
