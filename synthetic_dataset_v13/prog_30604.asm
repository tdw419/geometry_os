; DESCRIPTION: Places a blue line segment connecting (306, 26) to (198, 121).
; PLAN: r0=306(x1), r1=26(y1), r2=198(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 26
LDI r2, 198
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
