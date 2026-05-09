; DESCRIPTION: Draws a yellow line from (340, 9) to (439, 80).
; PLAN: r0=340(x1), r1=9(y1), r2=439(x2), r3=80(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 340
LDI r1, 9
LDI r2, 439
LDI r3, 80
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
