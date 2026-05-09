; DESCRIPTION: Draws a magenta line from (107, 45) to (397, 24).
; PLAN: r0=107(x1), r1=45(y1), r2=397(x2), r3=24(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 45
LDI r2, 397
LDI r3, 24
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
