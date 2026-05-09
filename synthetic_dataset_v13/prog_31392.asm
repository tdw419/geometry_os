; DESCRIPTION: Draws a yellow line from (248, 211) to (301, 80).
; PLAN: r0=248(x1), r1=211(y1), r2=301(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 211
LDI r2, 301
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
