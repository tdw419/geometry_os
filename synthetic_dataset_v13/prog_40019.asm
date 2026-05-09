; DESCRIPTION: Places a blue line segment connecting (481, 223) to (293, 214).
; PLAN: r0=481(x1), r1=223(y1), r2=293(x2), r3=214(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 223
LDI r2, 293
LDI r3, 214
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
