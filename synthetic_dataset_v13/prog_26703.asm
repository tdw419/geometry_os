; DESCRIPTION: Renders a white line between points (183, 164) and (78, 25).
; PLAN: r0=183(x1), r1=164(y1), r2=78(x2), r3=25(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 164
LDI r2, 78
LDI r3, 25
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
