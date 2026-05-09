; DESCRIPTION: Draws a white line from (173, 155) to (436, 110).
; PLAN: r0=173(x1), r1=155(y1), r2=436(x2), r3=110(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 155
LDI r2, 436
LDI r3, 110
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
