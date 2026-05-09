; DESCRIPTION: Renders a orange line between points (175, 248) and (249, 31).
; PLAN: r0=175(x1), r1=248(y1), r2=249(x2), r3=31(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 248
LDI r2, 249
LDI r3, 31
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
