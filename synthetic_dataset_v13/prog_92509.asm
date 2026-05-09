; DESCRIPTION: Places a blue line segment connecting (180, 2) to (23, 29).
; PLAN: r0=180(x1), r1=2(y1), r2=23(x2), r3=29(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 2
LDI r2, 23
LDI r3, 29
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
