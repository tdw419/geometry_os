; DESCRIPTION: Places a blue line segment connecting (206, 1) to (61, 222).
; PLAN: r0=206(x1), r1=1(y1), r2=61(x2), r3=222(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 1
LDI r2, 61
LDI r3, 222
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
