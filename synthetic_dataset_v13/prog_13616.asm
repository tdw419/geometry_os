; DESCRIPTION: Draws a black line from (433, 177) to (188, 200).
; PLAN: r0=433(x1), r1=177(y1), r2=188(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 177
LDI r2, 188
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
