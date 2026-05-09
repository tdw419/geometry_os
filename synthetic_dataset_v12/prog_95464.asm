; DESCRIPTION: Draws a white line from (409, 25) to (252, 137).
; PLAN: r0=409(x1), r1=25(y1), r2=252(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 25
LDI r2, 252
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
