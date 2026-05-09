; DESCRIPTION: Draws a white line from (16, 216) to (353, 88).
; PLAN: r0=16(x1), r1=216(y1), r2=353(x2), r3=88(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 216
LDI r2, 353
LDI r3, 88
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
