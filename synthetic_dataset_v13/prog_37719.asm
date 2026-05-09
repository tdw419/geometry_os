; DESCRIPTION: Draws a black line from (120, 138) to (390, 220).
; PLAN: r0=120(x1), r1=138(y1), r2=390(x2), r3=220(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 138
LDI r2, 390
LDI r3, 220
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
