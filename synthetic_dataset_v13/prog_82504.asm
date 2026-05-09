; DESCRIPTION: Draws a red line from (439, 154) to (392, 122).
; PLAN: r0=439(x1), r1=154(y1), r2=392(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 154
LDI r2, 392
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
