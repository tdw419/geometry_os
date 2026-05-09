; DESCRIPTION: Draws a white line from (442, 123) to (192, 140).
; PLAN: r0=442(x1), r1=123(y1), r2=192(x2), r3=140(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 123
LDI r2, 192
LDI r3, 140
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
