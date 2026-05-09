; DESCRIPTION: Draws a white line from (191, 100) to (319, 22).
; PLAN: r0=191(x1), r1=100(y1), r2=319(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 100
LDI r2, 319
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
