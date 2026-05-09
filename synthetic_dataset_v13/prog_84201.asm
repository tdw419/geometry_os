; DESCRIPTION: Draws a cyan line from (227, 216) to (88, 90).
; PLAN: r0=227(x1), r1=216(y1), r2=88(x2), r3=90(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 216
LDI r2, 88
LDI r3, 90
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
