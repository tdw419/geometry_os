; DESCRIPTION: Places a magenta line segment connecting (83, 50) to (72, 98).
; PLAN: r0=83(x1), r1=50(y1), r2=72(x2), r3=98(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 50
LDI r2, 72
LDI r3, 98
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
