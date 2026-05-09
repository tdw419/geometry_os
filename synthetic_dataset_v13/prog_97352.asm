; DESCRIPTION: Draws a white line from (67, 12) to (121, 73).
; PLAN: r0=67(x1), r1=12(y1), r2=121(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 12
LDI r2, 121
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
