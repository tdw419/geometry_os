; DESCRIPTION: Draws a white line from (471, 53) to (460, 101).
; PLAN: r0=471(x1), r1=53(y1), r2=460(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 53
LDI r2, 460
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
