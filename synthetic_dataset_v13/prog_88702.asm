; DESCRIPTION: Draws a green line from (416, 122) to (207, 115).
; PLAN: r0=416(x1), r1=122(y1), r2=207(x2), r3=115(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 122
LDI r2, 207
LDI r3, 115
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
