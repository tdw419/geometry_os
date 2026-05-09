; DESCRIPTION: Draws a white line from (165, 233) to (222, 249).
; PLAN: r0=165(x1), r1=233(y1), r2=222(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 233
LDI r2, 222
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
