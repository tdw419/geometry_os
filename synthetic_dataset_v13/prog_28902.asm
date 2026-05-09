; DESCRIPTION: Draws a white line from (416, 159) to (112, 53).
; PLAN: r0=416(x1), r1=159(y1), r2=112(x2), r3=53(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 159
LDI r2, 112
LDI r3, 53
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
