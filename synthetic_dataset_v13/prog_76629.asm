; DESCRIPTION: Draws a green line from (108, 224) to (185, 128).
; PLAN: r0=108(x1), r1=224(y1), r2=185(x2), r3=128(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 224
LDI r2, 185
LDI r3, 128
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
