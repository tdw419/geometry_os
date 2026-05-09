; DESCRIPTION: Places a magenta line segment connecting (299, 10) to (251, 172).
; PLAN: r0=299(x1), r1=10(y1), r2=251(x2), r3=172(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 10
LDI r2, 251
LDI r3, 172
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
