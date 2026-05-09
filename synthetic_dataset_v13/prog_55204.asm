; DESCRIPTION: Renders a magenta line between points (372, 197) and (9, 203).
; PLAN: r0=372(x1), r1=197(y1), r2=9(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 197
LDI r2, 9
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
