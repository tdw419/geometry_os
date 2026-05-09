; DESCRIPTION: Renders a magenta line between points (114, 9) and (161, 52).
; PLAN: r0=114(x1), r1=9(y1), r2=161(x2), r3=52(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 9
LDI r2, 161
LDI r3, 52
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
