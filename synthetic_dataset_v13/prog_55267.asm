; DESCRIPTION: Places a blue line segment connecting (398, 202) to (52, 153).
; PLAN: r0=398(x1), r1=202(y1), r2=52(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 202
LDI r2, 52
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
