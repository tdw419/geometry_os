; DESCRIPTION: Renders a white line between points (86, 97) and (492, 217).
; PLAN: r0=86(x1), r1=97(y1), r2=492(x2), r3=217(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 97
LDI r2, 492
LDI r3, 217
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
