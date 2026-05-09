; DESCRIPTION: Renders a magenta line between points (306, 176) and (54, 52).
; PLAN: r0=306(x1), r1=176(y1), r2=54(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 176
LDI r2, 54
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
