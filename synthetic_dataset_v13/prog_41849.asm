; DESCRIPTION: Draws a white line from (406, 72) to (439, 83).
; PLAN: r0=406(x1), r1=72(y1), r2=439(x2), r3=83(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 72
LDI r2, 439
LDI r3, 83
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
