; DESCRIPTION: Draws a white line from (188, 63) to (376, 224).
; PLAN: r0=188(x1), r1=63(y1), r2=376(x2), r3=224(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 63
LDI r2, 376
LDI r3, 224
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
