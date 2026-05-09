; DESCRIPTION: Places a blue line segment connecting (294, 145) to (356, 138).
; PLAN: r0=294(x1), r1=145(y1), r2=356(x2), r3=138(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 145
LDI r2, 356
LDI r3, 138
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
