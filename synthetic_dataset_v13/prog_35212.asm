; DESCRIPTION: Draws a blue line from (318, 118) to (346, 13).
; PLAN: r0=318(x1), r1=118(y1), r2=346(x2), r3=13(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 118
LDI r2, 346
LDI r3, 13
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
