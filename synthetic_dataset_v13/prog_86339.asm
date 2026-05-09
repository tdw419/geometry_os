; DESCRIPTION: Places a blue line segment connecting (384, 77) to (480, 179).
; PLAN: r0=384(x1), r1=77(y1), r2=480(x2), r3=179(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 77
LDI r2, 480
LDI r3, 179
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
