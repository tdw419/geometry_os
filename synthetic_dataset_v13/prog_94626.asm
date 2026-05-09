; DESCRIPTION: Draws a magenta line from (140, 86) to (43, 154).
; PLAN: r0=140(x1), r1=86(y1), r2=43(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 86
LDI r2, 43
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
