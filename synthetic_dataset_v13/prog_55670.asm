; DESCRIPTION: Renders a orange line between points (127, 188) and (159, 143).
; PLAN: r0=127(x1), r1=188(y1), r2=159(x2), r3=143(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 188
LDI r2, 159
LDI r3, 143
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
