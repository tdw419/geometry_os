; DESCRIPTION: Renders a yellow line between points (429, 226) and (188, 203).
; PLAN: r0=429(x1), r1=226(y1), r2=188(x2), r3=203(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 226
LDI r2, 188
LDI r3, 203
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
