; DESCRIPTION: Draws a magenta line from (46, 58) to (20, 54).
; PLAN: r0=46(x1), r1=58(y1), r2=20(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 58
LDI r2, 20
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
