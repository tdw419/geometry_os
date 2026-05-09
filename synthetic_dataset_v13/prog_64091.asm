; DESCRIPTION: Draws a magenta line from (224, 56) to (104, 148).
; PLAN: r0=224(x1), r1=56(y1), r2=104(x2), r3=148(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 56
LDI r2, 104
LDI r3, 148
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
