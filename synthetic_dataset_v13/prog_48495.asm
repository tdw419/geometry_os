; DESCRIPTION: Places a white line segment connecting (476, 165) to (162, 197).
; PLAN: r0=476(x1), r1=165(y1), r2=162(x2), r3=197(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 476
LDI r1, 165
LDI r2, 162
LDI r3, 197
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
