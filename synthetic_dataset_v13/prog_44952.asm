; DESCRIPTION: Places a magenta line segment connecting (450, 35) to (93, 184).
; PLAN: r0=450(x1), r1=35(y1), r2=93(x2), r3=184(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 35
LDI r2, 93
LDI r3, 184
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
