; DESCRIPTION: Draws a white line from (208, 1) to (232, 70).
; PLAN: r0=208(x1), r1=1(y1), r2=232(x2), r3=70(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 1
LDI r2, 232
LDI r3, 70
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
