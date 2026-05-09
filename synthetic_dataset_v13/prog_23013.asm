; DESCRIPTION: Places a blue line segment connecting (57, 46) to (474, 30).
; PLAN: r0=57(x1), r1=46(y1), r2=474(x2), r3=30(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 46
LDI r2, 474
LDI r3, 30
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
