; DESCRIPTION: Draws a white line from (35, 233) to (261, 70).
; PLAN: r0=35(x1), r1=233(y1), r2=261(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 233
LDI r2, 261
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
