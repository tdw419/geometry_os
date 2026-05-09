; DESCRIPTION: Draws a black line from (439, 179) to (224, 157).
; PLAN: r0=439(x1), r1=179(y1), r2=224(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 179
LDI r2, 224
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
