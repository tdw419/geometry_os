; DESCRIPTION: Places a magenta line segment connecting (229, 26) to (50, 120).
; PLAN: r0=229(x1), r1=26(y1), r2=50(x2), r3=120(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 26
LDI r2, 50
LDI r3, 120
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
