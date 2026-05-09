; DESCRIPTION: Draws a white line from (8, 54) to (162, 172).
; PLAN: r0=8(x1), r1=54(y1), r2=162(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 54
LDI r2, 162
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
