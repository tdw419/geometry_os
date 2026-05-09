; DESCRIPTION: Places a blue line segment connecting (380, 126) to (359, 41).
; PLAN: r0=380(x1), r1=126(y1), r2=359(x2), r3=41(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 126
LDI r2, 359
LDI r3, 41
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
