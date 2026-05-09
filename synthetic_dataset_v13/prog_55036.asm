; DESCRIPTION: Renders a magenta line between points (180, 185) and (159, 27).
; PLAN: r0=180(x1), r1=185(y1), r2=159(x2), r3=27(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 185
LDI r2, 159
LDI r3, 27
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
