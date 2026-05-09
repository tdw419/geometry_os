; DESCRIPTION: Draws a yellow line from (198, 69) to (500, 251).
; PLAN: r0=198(x1), r1=69(y1), r2=500(x2), r3=251(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 69
LDI r2, 500
LDI r3, 251
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
