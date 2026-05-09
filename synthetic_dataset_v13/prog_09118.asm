; DESCRIPTION: Renders a magenta line between points (39, 117) and (35, 101).
; PLAN: r0=39(x1), r1=117(y1), r2=35(x2), r3=101(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 117
LDI r2, 35
LDI r3, 101
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
