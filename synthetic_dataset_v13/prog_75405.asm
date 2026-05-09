; DESCRIPTION: Places a magenta line segment connecting (380, 132) to (454, 204).
; PLAN: r0=380(x1), r1=132(y1), r2=454(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 132
LDI r2, 454
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
