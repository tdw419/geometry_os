; DESCRIPTION: Draws a white line from (44, 189) to (209, 34).
; PLAN: r0=44(x1), r1=189(y1), r2=209(x2), r3=34(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 189
LDI r2, 209
LDI r3, 34
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
