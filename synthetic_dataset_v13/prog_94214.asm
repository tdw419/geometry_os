; DESCRIPTION: Renders a green line between points (416, 122) and (31, 43).
; PLAN: r0=416(x1), r1=122(y1), r2=31(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 122
LDI r2, 31
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
