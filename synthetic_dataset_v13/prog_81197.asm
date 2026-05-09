; DESCRIPTION: Renders a white line between points (361, 94) and (207, 97).
; PLAN: r0=361(x1), r1=94(y1), r2=207(x2), r3=97(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 94
LDI r2, 207
LDI r3, 97
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
