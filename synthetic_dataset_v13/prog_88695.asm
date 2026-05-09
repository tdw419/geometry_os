; DESCRIPTION: Draws a magenta line from (200, 83) to (157, 154).
; PLAN: r0=200(x1), r1=83(y1), r2=157(x2), r3=154(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 83
LDI r2, 157
LDI r3, 154
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
