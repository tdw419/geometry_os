; DESCRIPTION: Places a magenta line segment connecting (380, 120) to (409, 245).
; PLAN: r0=380(x1), r1=120(y1), r2=409(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 120
LDI r2, 409
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
