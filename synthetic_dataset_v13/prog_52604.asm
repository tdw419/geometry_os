; DESCRIPTION: Draws a green line from (233, 12) to (216, 175).
; PLAN: r0=233(x1), r1=12(y1), r2=216(x2), r3=175(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 12
LDI r2, 216
LDI r3, 175
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
