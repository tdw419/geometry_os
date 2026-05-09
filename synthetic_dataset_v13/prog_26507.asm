; DESCRIPTION: Draws a white line from (217, 23) to (185, 29).
; PLAN: r0=217(x1), r1=23(y1), r2=185(x2), r3=29(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 23
LDI r2, 185
LDI r3, 29
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
