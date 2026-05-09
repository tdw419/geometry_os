; DESCRIPTION: Draws a magenta line from (188, 206) to (422, 165).
; PLAN: r0=188(x1), r1=206(y1), r2=422(x2), r3=165(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 206
LDI r2, 422
LDI r3, 165
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
