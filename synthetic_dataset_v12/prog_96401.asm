; DESCRIPTION: Draws a white line from (175, 34) to (457, 33).
; PLAN: r0=175(x1), r1=34(y1), r2=457(x2), r3=33(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 34
LDI r2, 457
LDI r3, 33
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
