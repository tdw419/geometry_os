; DESCRIPTION: Draws a white line from (163, 83) to (29, 144).
; PLAN: r0=163(x1), r1=83(y1), r2=29(x2), r3=144(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 83
LDI r2, 29
LDI r3, 144
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
