; DESCRIPTION: Places a magenta line segment connecting (385, 234) to (382, 35).
; PLAN: r0=385(x1), r1=234(y1), r2=382(x2), r3=35(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 234
LDI r2, 382
LDI r3, 35
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
