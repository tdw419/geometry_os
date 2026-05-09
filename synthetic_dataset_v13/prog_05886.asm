; DESCRIPTION: Places a orange line segment connecting (145, 93) to (154, 154).
; PLAN: r0=145(x1), r1=93(y1), r2=154(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 93
LDI r2, 154
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
