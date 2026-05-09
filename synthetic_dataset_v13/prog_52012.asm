; DESCRIPTION: Draws a magenta line from (409, 172) to (397, 81).
; PLAN: r0=409(x1), r1=172(y1), r2=397(x2), r3=81(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 172
LDI r2, 397
LDI r3, 81
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
