; DESCRIPTION: Places a magenta line segment connecting (497, 171) to (283, 21).
; PLAN: r0=497(x1), r1=171(y1), r2=283(x2), r3=21(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 171
LDI r2, 283
LDI r3, 21
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
