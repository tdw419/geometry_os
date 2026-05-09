; DESCRIPTION: Draws a white line from (244, 10) to (439, 143).
; PLAN: r0=244(x1), r1=10(y1), r2=439(x2), r3=143(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 10
LDI r2, 439
LDI r3, 143
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
