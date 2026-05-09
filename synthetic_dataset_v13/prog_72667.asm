; DESCRIPTION: Draws a white line from (112, 212) to (70, 175).
; PLAN: r0=112(x1), r1=212(y1), r2=70(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 212
LDI r2, 70
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
