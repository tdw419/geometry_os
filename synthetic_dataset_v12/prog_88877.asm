; DESCRIPTION: Draws a magenta line from (224, 211) to (71, 196).
; PLAN: r0=224(x1), r1=211(y1), r2=71(x2), r3=196(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 211
LDI r2, 71
LDI r3, 196
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
