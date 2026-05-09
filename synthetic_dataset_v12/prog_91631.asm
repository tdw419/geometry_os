; DESCRIPTION: Draws a red line from (149, 21) to (439, 107).
; PLAN: r0=149(x1), r1=21(y1), r2=439(x2), r3=107(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 21
LDI r2, 439
LDI r3, 107
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
