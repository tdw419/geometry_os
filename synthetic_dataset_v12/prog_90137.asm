; DESCRIPTION: Places a blue line segment connecting (494, 223) to (440, 77).
; PLAN: r0=494(x1), r1=223(y1), r2=440(x2), r3=77(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 223
LDI r2, 440
LDI r3, 77
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
