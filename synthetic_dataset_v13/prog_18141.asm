; DESCRIPTION: Renders a magenta line between points (196, 161) and (85, 144).
; PLAN: r0=196(x1), r1=161(y1), r2=85(x2), r3=144(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 161
LDI r2, 85
LDI r3, 144
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
