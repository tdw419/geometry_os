; DESCRIPTION: Places a blue line segment connecting (239, 179) to (293, 54).
; PLAN: r0=239(x1), r1=179(y1), r2=293(x2), r3=54(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 179
LDI r2, 293
LDI r3, 54
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
