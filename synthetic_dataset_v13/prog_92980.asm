; DESCRIPTION: Places a red line segment connecting (393, 43) to (443, 54).
; PLAN: r0=393(x1), r1=43(y1), r2=443(x2), r3=54(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 43
LDI r2, 443
LDI r3, 54
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
