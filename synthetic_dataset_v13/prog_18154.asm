; DESCRIPTION: Renders a magenta line between points (489, 144) and (127, 109).
; PLAN: r0=489(x1), r1=144(y1), r2=127(x2), r3=109(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 144
LDI r2, 127
LDI r3, 109
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
