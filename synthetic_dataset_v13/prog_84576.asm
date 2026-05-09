; DESCRIPTION: Draws a purple line from (123, 113) to (10, 166).
; PLAN: r0=123(x1), r1=113(y1), r2=10(x2), r3=166(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 113
LDI r2, 10
LDI r3, 166
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
