; DESCRIPTION: Draws a green line from (487, 192) to (359, 224).
; PLAN: r0=487(x1), r1=192(y1), r2=359(x2), r3=224(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 192
LDI r2, 359
LDI r3, 224
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
