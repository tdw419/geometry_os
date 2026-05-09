; DESCRIPTION: Draws a cyan line from (416, 184) to (489, 147).
; PLAN: r0=416(x1), r1=184(y1), r2=489(x2), r3=147(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 184
LDI r2, 489
LDI r3, 147
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
