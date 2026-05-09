; DESCRIPTION: Places a magenta line segment connecting (292, 199) to (96, 67).
; PLAN: r0=292(x1), r1=199(y1), r2=96(x2), r3=67(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 199
LDI r2, 96
LDI r3, 67
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
