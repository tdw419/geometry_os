; DESCRIPTION: Draws a white line from (490, 176) to (4, 22).
; PLAN: r0=490(x1), r1=176(y1), r2=4(x2), r3=22(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 176
LDI r2, 4
LDI r3, 22
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
