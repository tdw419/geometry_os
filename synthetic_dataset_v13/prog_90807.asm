; DESCRIPTION: Draws a yellow line from (418, 158) to (439, 46).
; PLAN: r0=418(x1), r1=158(y1), r2=439(x2), r3=46(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 158
LDI r2, 439
LDI r3, 46
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
