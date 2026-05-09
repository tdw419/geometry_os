; DESCRIPTION: Places a red line segment connecting (442, 50) to (63, 145).
; PLAN: r0=442(x1), r1=50(y1), r2=63(x2), r3=145(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 50
LDI r2, 63
LDI r3, 145
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
