; DESCRIPTION: Draws a white line from (137, 25) to (105, 221).
; PLAN: r0=137(x1), r1=25(y1), r2=105(x2), r3=221(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 25
LDI r2, 105
LDI r3, 221
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
