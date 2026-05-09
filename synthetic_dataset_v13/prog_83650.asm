; DESCRIPTION: Renders a yellow line between points (276, 66) and (110, 253).
; PLAN: r0=276(x1), r1=66(y1), r2=110(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 66
LDI r2, 110
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
