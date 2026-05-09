; DESCRIPTION: Draws a magenta line from (107, 224) to (375, 45).
; PLAN: r0=107(x1), r1=224(y1), r2=375(x2), r3=45(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 224
LDI r2, 375
LDI r3, 45
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
