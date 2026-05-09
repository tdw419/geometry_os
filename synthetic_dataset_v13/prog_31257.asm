; DESCRIPTION: Places a blue line segment connecting (291, 193) to (453, 27).
; PLAN: r0=291(x1), r1=193(y1), r2=453(x2), r3=27(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 193
LDI r2, 453
LDI r3, 27
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
