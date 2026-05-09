; DESCRIPTION: Draws a yellow line from (243, 211) to (439, 56).
; PLAN: r0=243(x1), r1=211(y1), r2=439(x2), r3=56(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 211
LDI r2, 439
LDI r3, 56
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
