; DESCRIPTION: Renders a orange line between points (482, 53) and (142, 14).
; PLAN: r0=482(x1), r1=53(y1), r2=142(x2), r3=14(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 482
LDI r1, 53
LDI r2, 142
LDI r3, 14
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
