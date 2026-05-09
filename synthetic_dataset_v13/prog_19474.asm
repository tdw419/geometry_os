; DESCRIPTION: Places a yellow line segment connecting (344, 70) to (120, 214).
; PLAN: r0=344(x1), r1=70(y1), r2=120(x2), r3=214(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 70
LDI r2, 120
LDI r3, 214
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
