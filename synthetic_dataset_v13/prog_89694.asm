; DESCRIPTION: Places a blue line segment connecting (215, 234) to (77, 207).
; PLAN: r0=215(x1), r1=234(y1), r2=77(x2), r3=207(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 234
LDI r2, 77
LDI r3, 207
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
