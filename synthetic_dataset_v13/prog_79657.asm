; DESCRIPTION: Places a magenta line segment connecting (85, 187) to (444, 154).
; PLAN: r0=85(x1), r1=187(y1), r2=444(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 187
LDI r2, 444
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
