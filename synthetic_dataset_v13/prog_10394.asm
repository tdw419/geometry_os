; DESCRIPTION: Renders a magenta line between points (166, 250) and (121, 123).
; PLAN: r0=166(x1), r1=250(y1), r2=121(x2), r3=123(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 250
LDI r2, 121
LDI r3, 123
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
