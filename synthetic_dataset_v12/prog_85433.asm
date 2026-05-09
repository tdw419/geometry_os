; DESCRIPTION: Draws a red line from (417, 186) to (128, 245).
; PLAN: r0=417(x1), r1=186(y1), r2=128(x2), r3=245(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 186
LDI r2, 128
LDI r3, 245
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
