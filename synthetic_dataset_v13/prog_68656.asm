; DESCRIPTION: Renders a magenta line between points (121, 117) and (334, 15).
; PLAN: r0=121(x1), r1=117(y1), r2=334(x2), r3=15(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 117
LDI r2, 334
LDI r3, 15
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
