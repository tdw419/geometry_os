; DESCRIPTION: Places a orange line segment connecting (507, 20) to (481, 215).
; PLAN: r0=507(x1), r1=20(y1), r2=481(x2), r3=215(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 20
LDI r2, 481
LDI r3, 215
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
