; DESCRIPTION: Draws a white line from (144, 43) to (125, 115).
; PLAN: r0=144(x1), r1=43(y1), r2=125(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 43
LDI r2, 125
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
