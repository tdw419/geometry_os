; DESCRIPTION: Places a orange line segment connecting (5, 210) to (442, 95).
; PLAN: r0=5(x1), r1=210(y1), r2=442(x2), r3=95(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 5
LDI r1, 210
LDI r2, 442
LDI r3, 95
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
