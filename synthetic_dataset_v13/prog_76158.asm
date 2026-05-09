; DESCRIPTION: Draws a green line from (67, 169) to (416, 122).
; PLAN: r0=67(x1), r1=169(y1), r2=416(x2), r3=122(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 67
LDI r1, 169
LDI r2, 416
LDI r3, 122
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
