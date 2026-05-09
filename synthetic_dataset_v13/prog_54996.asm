; DESCRIPTION: Renders a magenta line between points (468, 123) and (121, 176).
; PLAN: r0=468(x1), r1=123(y1), r2=121(x2), r3=176(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 468
LDI r1, 123
LDI r2, 121
LDI r3, 176
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
