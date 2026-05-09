; DESCRIPTION: Draws a magenta line from (288, 20) to (414, 50).
; PLAN: r0=288(x1), r1=20(y1), r2=414(x2), r3=50(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 20
LDI r2, 414
LDI r3, 50
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
