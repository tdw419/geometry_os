; DESCRIPTION: Draws a white line from (442, 172) to (40, 211).
; PLAN: r0=442(x1), r1=172(y1), r2=40(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 172
LDI r2, 40
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
