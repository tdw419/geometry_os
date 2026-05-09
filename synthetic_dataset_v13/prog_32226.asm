; DESCRIPTION: Draws a white line from (312, 18) to (110, 142).
; PLAN: r0=312(x1), r1=18(y1), r2=110(x2), r3=142(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 312
LDI r1, 18
LDI r2, 110
LDI r3, 142
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
