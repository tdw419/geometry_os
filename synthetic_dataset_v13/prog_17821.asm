; DESCRIPTION: Draws a magenta line from (376, 201) to (224, 60).
; PLAN: r0=376(x1), r1=201(y1), r2=224(x2), r3=60(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 201
LDI r2, 224
LDI r3, 60
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
