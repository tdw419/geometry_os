; DESCRIPTION: Draws a white line from (507, 88) to (306, 71).
; PLAN: r0=507(x1), r1=88(y1), r2=306(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 88
LDI r2, 306
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
