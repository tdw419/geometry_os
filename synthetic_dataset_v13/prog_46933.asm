; DESCRIPTION: Draws a magenta line from (5, 97) to (100, 154).
; PLAN: r0=5(x1), r1=97(y1), r2=100(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 97
LDI r2, 100
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
