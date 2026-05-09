; DESCRIPTION: Places a magenta line segment connecting (288, 189) to (293, 73).
; PLAN: r0=288(x1), r1=189(y1), r2=293(x2), r3=73(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 189
LDI r2, 293
LDI r3, 73
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
