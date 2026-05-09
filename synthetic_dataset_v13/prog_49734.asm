; DESCRIPTION: Draws a yellow line from (38, 224) to (304, 96).
; PLAN: r0=38(x1), r1=224(y1), r2=304(x2), r3=96(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 224
LDI r2, 304
LDI r3, 96
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
