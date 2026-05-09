; DESCRIPTION: Draws a white line from (33, 20) to (471, 200).
; PLAN: r0=33(x1), r1=20(y1), r2=471(x2), r3=200(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 20
LDI r2, 471
LDI r3, 200
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
