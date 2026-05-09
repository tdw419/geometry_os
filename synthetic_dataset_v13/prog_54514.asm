; DESCRIPTION: Renders a white line between points (16, 250) and (276, 248).
; PLAN: r0=16(x1), r1=250(y1), r2=276(x2), r3=248(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 250
LDI r2, 276
LDI r3, 248
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
