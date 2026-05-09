; DESCRIPTION: Places a black line segment connecting (344, 80) to (215, 165).
; PLAN: r0=344(x1), r1=80(y1), r2=215(x2), r3=165(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 80
LDI r2, 215
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
