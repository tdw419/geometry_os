; DESCRIPTION: Places a magenta line segment connecting (494, 96) to (419, 170).
; PLAN: r0=494(x1), r1=96(y1), r2=419(x2), r3=170(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 494
LDI r1, 96
LDI r2, 419
LDI r3, 170
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
