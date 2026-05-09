; DESCRIPTION: Places a blue line segment connecting (192, 234) to (481, 28).
; PLAN: r0=192(x1), r1=234(y1), r2=481(x2), r3=28(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 234
LDI r2, 481
LDI r3, 28
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
