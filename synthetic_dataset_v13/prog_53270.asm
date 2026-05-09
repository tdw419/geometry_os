; DESCRIPTION: Draws a white line from (0, 151) to (325, 74).
; PLAN: r0=0(x1), r1=151(y1), r2=325(x2), r3=74(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 151
LDI r2, 325
LDI r3, 74
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
