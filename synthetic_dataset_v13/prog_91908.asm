; DESCRIPTION: Draws a white line from (297, 41) to (435, 88).
; PLAN: r0=297(x1), r1=41(y1), r2=435(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 41
LDI r2, 435
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
