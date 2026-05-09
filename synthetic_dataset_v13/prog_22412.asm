; DESCRIPTION: Draws a yellow line from (439, 65) to (273, 2).
; PLAN: r0=439(x1), r1=65(y1), r2=273(x2), r3=2(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 65
LDI r2, 273
LDI r3, 2
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
