; DESCRIPTION: Draws a yellow line from (256, 224) to (108, 187).
; PLAN: r0=256(x1), r1=224(y1), r2=108(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 224
LDI r2, 108
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
