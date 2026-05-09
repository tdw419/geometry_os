; DESCRIPTION: Draws a green line from (137, 224) to (454, 82).
; PLAN: r0=137(x1), r1=224(y1), r2=454(x2), r3=82(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 224
LDI r2, 454
LDI r3, 82
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
