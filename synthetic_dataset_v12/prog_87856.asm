; DESCRIPTION: Draws a white line from (319, 30) to (462, 227).
; PLAN: r0=319(x1), r1=30(y1), r2=462(x2), r3=227(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 30
LDI r2, 462
LDI r3, 227
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
