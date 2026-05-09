; DESCRIPTION: Places a blue line segment connecting (82, 237) to (160, 124).
; PLAN: r0=82(x1), r1=237(y1), r2=160(x2), r3=124(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 237
LDI r2, 160
LDI r3, 124
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
