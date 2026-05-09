; DESCRIPTION: Renders a magenta line between points (324, 233) and (75, 148).
; PLAN: r0=324(x1), r1=233(y1), r2=75(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 233
LDI r2, 75
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
