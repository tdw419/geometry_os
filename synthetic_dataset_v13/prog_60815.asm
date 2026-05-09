; DESCRIPTION: Places a green line segment connecting (46, 41) to (208, 44).
; PLAN: r0=46(x1), r1=41(y1), r2=208(x2), r3=44(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 41
LDI r2, 208
LDI r3, 44
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
