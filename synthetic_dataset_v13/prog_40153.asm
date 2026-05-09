; DESCRIPTION: Draws a purple line from (243, 175) to (49, 240).
; PLAN: r0=243(x1), r1=175(y1), r2=49(x2), r3=240(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 175
LDI r2, 49
LDI r3, 240
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
