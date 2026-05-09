; DESCRIPTION: Draws a purple line from (504, 26) to (175, 168).
; PLAN: r0=504(x1), r1=26(y1), r2=175(x2), r3=168(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 504
LDI r1, 26
LDI r2, 175
LDI r3, 168
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
