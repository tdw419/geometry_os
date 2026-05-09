; DESCRIPTION: Draws a white line from (123, 35) to (132, 184).
; PLAN: r0=123(x1), r1=35(y1), r2=132(x2), r3=184(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 35
LDI r2, 132
LDI r3, 184
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
