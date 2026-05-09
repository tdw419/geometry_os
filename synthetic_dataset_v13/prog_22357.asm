; DESCRIPTION: Places a magenta line segment connecting (62, 37) to (275, 50).
; PLAN: r0=62(x1), r1=37(y1), r2=275(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 37
LDI r2, 275
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
