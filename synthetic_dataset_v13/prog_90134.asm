; DESCRIPTION: Draws a white line from (160, 66) to (129, 246).
; PLAN: r0=160(x1), r1=66(y1), r2=129(x2), r3=246(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 66
LDI r2, 129
LDI r3, 246
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
