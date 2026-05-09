; DESCRIPTION: Draws a blue line from (224, 179) to (320, 204).
; PLAN: r0=224(x1), r1=179(y1), r2=320(x2), r3=204(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 179
LDI r2, 320
LDI r3, 204
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
