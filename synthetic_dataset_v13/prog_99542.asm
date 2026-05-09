; DESCRIPTION: Places a green line segment connecting (249, 35) to (443, 99).
; PLAN: r0=249(x1), r1=35(y1), r2=443(x2), r3=99(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 35
LDI r2, 443
LDI r3, 99
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
