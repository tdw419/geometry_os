; DESCRIPTION: Renders a white line between points (323, 12) and (444, 248).
; PLAN: r0=323(x1), r1=12(y1), r2=444(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 12
LDI r2, 444
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
