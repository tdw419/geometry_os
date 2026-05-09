; DESCRIPTION: Renders a orange line between points (482, 34) and (150, 222).
; PLAN: r0=482(x1), r1=34(y1), r2=150(x2), r3=222(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 34
LDI r2, 150
LDI r3, 222
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
