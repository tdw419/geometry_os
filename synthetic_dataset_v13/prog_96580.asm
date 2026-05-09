; DESCRIPTION: Places a red line segment connecting (248, 198) to (416, 250).
; PLAN: r0=248(x1), r1=198(y1), r2=416(x2), r3=250(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 198
LDI r2, 416
LDI r3, 250
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
