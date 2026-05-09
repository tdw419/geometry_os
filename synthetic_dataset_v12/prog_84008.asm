; DESCRIPTION: Draws a white line from (83, 151) to (491, 0).
; PLAN: r0=83(x1), r1=151(y1), r2=491(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 151
LDI r2, 491
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
