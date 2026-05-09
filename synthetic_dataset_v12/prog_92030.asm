; DESCRIPTION: Draws a blue line from (233, 249) to (251, 18).
; PLAN: r0=233(x1), r1=249(y1), r2=251(x2), r3=18(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 249
LDI r2, 251
LDI r3, 18
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
