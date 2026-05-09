; DESCRIPTION: Renders a magenta line between points (362, 9) and (34, 62).
; PLAN: r0=362(x1), r1=9(y1), r2=34(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 9
LDI r2, 34
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
