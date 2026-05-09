; DESCRIPTION: Draws a magenta line from (422, 226) to (132, 203).
; PLAN: r0=422(x1), r1=226(y1), r2=132(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 226
LDI r2, 132
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
