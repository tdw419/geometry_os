; DESCRIPTION: Draws a orange line from (162, 120) to (86, 154).
; PLAN: r0=162(x1), r1=120(y1), r2=86(x2), r3=154(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 120
LDI r2, 86
LDI r3, 154
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
