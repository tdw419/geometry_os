; DESCRIPTION: Places a magenta line segment connecting (497, 164) to (185, 16).
; PLAN: r0=497(x1), r1=164(y1), r2=185(x2), r3=16(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 164
LDI r2, 185
LDI r3, 16
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
