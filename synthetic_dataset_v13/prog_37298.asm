; DESCRIPTION: Places a orange line segment connecting (446, 76) to (30, 107).
; PLAN: r0=446(x1), r1=76(y1), r2=30(x2), r3=107(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 76
LDI r2, 30
LDI r3, 107
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
