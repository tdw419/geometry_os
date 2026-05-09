; DESCRIPTION: Draws a magenta line from (422, 1) to (420, 13).
; PLAN: r0=422(x1), r1=1(y1), r2=420(x2), r3=13(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 1
LDI r2, 420
LDI r3, 13
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
