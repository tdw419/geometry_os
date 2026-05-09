; DESCRIPTION: Places a orange line segment connecting (344, 180) to (454, 215).
; PLAN: r0=344(x1), r1=180(y1), r2=454(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 180
LDI r2, 454
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
