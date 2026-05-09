; DESCRIPTION: Places a white line segment connecting (166, 31) to (443, 169).
; PLAN: r0=166(x1), r1=31(y1), r2=443(x2), r3=169(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 31
LDI r2, 443
LDI r3, 169
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
