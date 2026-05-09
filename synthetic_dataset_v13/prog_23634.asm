; DESCRIPTION: Draws a white line from (288, 143) to (112, 175).
; PLAN: r0=288(x1), r1=143(y1), r2=112(x2), r3=175(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 143
LDI r2, 112
LDI r3, 175
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
