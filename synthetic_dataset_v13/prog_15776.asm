; DESCRIPTION: Draws a white line from (264, 254) to (491, 121).
; PLAN: r0=264(x1), r1=254(y1), r2=491(x2), r3=121(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 254
LDI r2, 491
LDI r3, 121
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
