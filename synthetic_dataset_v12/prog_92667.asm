; DESCRIPTION: Draws a white line from (77, 1) to (225, 211).
; PLAN: r0=77(x1), r1=1(y1), r2=225(x2), r3=211(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 1
LDI r2, 225
LDI r3, 211
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
