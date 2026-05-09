; DESCRIPTION: Draws a white line from (501, 36) to (35, 178).
; PLAN: r0=501(x1), r1=36(y1), r2=35(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 36
LDI r2, 35
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
