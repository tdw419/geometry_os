; DESCRIPTION: Places a orange line segment connecting (60, 46) to (446, 115).
; PLAN: r0=60(x1), r1=46(y1), r2=446(x2), r3=115(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 46
LDI r2, 446
LDI r3, 115
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
