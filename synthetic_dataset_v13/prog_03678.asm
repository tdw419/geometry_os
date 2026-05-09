; DESCRIPTION: Draws a magenta line from (217, 8) to (442, 122).
; PLAN: r0=217(x1), r1=8(y1), r2=442(x2), r3=122(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 8
LDI r2, 442
LDI r3, 122
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
