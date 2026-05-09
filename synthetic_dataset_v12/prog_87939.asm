; DESCRIPTION: Draws a white line from (127, 3) to (288, 217).
; PLAN: r0=127(x1), r1=3(y1), r2=288(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 3
LDI r2, 288
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
