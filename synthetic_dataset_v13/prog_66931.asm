; DESCRIPTION: Places a blue line segment connecting (486, 248) to (27, 149).
; PLAN: r0=486(x1), r1=248(y1), r2=27(x2), r3=149(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 248
LDI r2, 27
LDI r3, 149
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
