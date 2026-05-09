; DESCRIPTION: Draws a magenta line from (293, 206) to (310, 206).
; PLAN: r0=293(x1), r1=206(y1), r2=310(x2), r3=206(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 206
LDI r2, 310
LDI r3, 206
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
