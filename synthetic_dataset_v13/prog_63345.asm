; DESCRIPTION: Places a green line segment connecting (426, 58) to (243, 41).
; PLAN: r0=426(x1), r1=58(y1), r2=243(x2), r3=41(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 58
LDI r2, 243
LDI r3, 41
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
