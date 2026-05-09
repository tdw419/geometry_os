; DESCRIPTION: Places a orange line segment connecting (411, 212) to (52, 154).
; PLAN: r0=411(x1), r1=212(y1), r2=52(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 212
LDI r2, 52
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
