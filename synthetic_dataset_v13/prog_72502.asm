; DESCRIPTION: Places a blue line segment connecting (293, 215) to (381, 160).
; PLAN: r0=293(x1), r1=215(y1), r2=381(x2), r3=160(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 215
LDI r2, 381
LDI r3, 160
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
