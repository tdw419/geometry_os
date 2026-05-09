; DESCRIPTION: Renders a magenta line between points (129, 91) and (368, 178).
; PLAN: r0=129(x1), r1=91(y1), r2=368(x2), r3=178(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 91
LDI r2, 368
LDI r3, 178
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
