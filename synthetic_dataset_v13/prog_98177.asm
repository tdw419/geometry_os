; DESCRIPTION: Places a black line segment connecting (509, 165) to (344, 10).
; PLAN: r0=509(x1), r1=165(y1), r2=344(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 509
LDI r1, 165
LDI r2, 344
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
