; DESCRIPTION: Draws a magenta line from (459, 187) to (422, 17).
; PLAN: r0=459(x1), r1=187(y1), r2=422(x2), r3=17(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 187
LDI r2, 422
LDI r3, 17
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
