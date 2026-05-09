; DESCRIPTION: Places a blue line segment connecting (380, 226) to (402, 7).
; PLAN: r0=380(x1), r1=226(y1), r2=402(x2), r3=7(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 226
LDI r2, 402
LDI r3, 7
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
