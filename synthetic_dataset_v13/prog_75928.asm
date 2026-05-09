; DESCRIPTION: Places a white line segment connecting (110, 219) to (74, 198).
; PLAN: r0=110(x1), r1=219(y1), r2=74(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 219
LDI r2, 74
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
