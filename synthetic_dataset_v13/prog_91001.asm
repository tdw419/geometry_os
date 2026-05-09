; DESCRIPTION: Renders a magenta line between points (301, 199) and (9, 125).
; PLAN: r0=301(x1), r1=199(y1), r2=9(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 199
LDI r2, 9
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
