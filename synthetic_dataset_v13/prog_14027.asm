; DESCRIPTION: Draws a blue line from (123, 65) to (175, 115).
; PLAN: r0=123(x1), r1=65(y1), r2=175(x2), r3=115(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 65
LDI r2, 175
LDI r3, 115
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
