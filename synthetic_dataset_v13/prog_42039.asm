; DESCRIPTION: Draws a white line from (112, 159) to (270, 249).
; PLAN: r0=112(x1), r1=159(y1), r2=270(x2), r3=249(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 159
LDI r2, 270
LDI r3, 249
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
