; DESCRIPTION: Draws a white line from (233, 63) to (175, 148).
; PLAN: r0=233(x1), r1=63(y1), r2=175(x2), r3=148(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 63
LDI r2, 175
LDI r3, 148
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
