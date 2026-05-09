; DESCRIPTION: Renders a magenta line between points (75, 250) and (180, 212).
; PLAN: r0=75(x1), r1=250(y1), r2=180(x2), r3=212(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 250
LDI r2, 180
LDI r3, 212
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
