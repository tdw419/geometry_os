; DESCRIPTION: Renders a magenta line between points (35, 63) and (39, 3).
; PLAN: r0=35(x1), r1=63(y1), r2=39(x2), r3=3(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 63
LDI r2, 39
LDI r3, 3
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
