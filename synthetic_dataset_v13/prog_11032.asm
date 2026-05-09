; DESCRIPTION: Draws a white line from (170, 223) to (144, 217).
; PLAN: r0=170(x1), r1=223(y1), r2=144(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 223
LDI r2, 144
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
