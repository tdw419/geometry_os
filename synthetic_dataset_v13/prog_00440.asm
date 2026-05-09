; DESCRIPTION: Draws a yellow line from (224, 97) to (401, 191).
; PLAN: r0=224(x1), r1=97(y1), r2=401(x2), r3=191(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 97
LDI r2, 401
LDI r3, 191
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
