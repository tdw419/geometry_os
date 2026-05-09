; DESCRIPTION: Draws a black line from (395, 121) to (416, 68).
; PLAN: r0=395(x1), r1=121(y1), r2=416(x2), r3=68(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 121
LDI r2, 416
LDI r3, 68
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
