; DESCRIPTION: Places a green line segment connecting (41, 150) to (385, 83).
; PLAN: r0=41(x1), r1=150(y1), r2=385(x2), r3=83(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 150
LDI r2, 385
LDI r3, 83
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
