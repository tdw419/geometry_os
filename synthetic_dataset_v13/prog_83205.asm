; DESCRIPTION: Places a yellow line segment connecting (425, 41) to (231, 93).
; PLAN: r0=425(x1), r1=41(y1), r2=231(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 41
LDI r2, 231
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
