; DESCRIPTION: Draws a magenta line from (21, 189) to (91, 54).
; PLAN: r0=21(x1), r1=189(y1), r2=91(x2), r3=54(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 189
LDI r2, 91
LDI r3, 54
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
