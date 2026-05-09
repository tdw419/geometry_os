; DESCRIPTION: Places a orange line segment connecting (70, 22) to (186, 240).
; PLAN: r0=70(x1), r1=22(y1), r2=186(x2), r3=240(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 22
LDI r2, 186
LDI r3, 240
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
