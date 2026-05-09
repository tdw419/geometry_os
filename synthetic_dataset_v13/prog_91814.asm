; DESCRIPTION: Renders a white line between points (491, 151) and (31, 105).
; PLAN: r0=491(x1), r1=151(y1), r2=31(x2), r3=105(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 151
LDI r2, 31
LDI r3, 105
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
