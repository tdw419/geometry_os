; DESCRIPTION: Places a white line segment connecting (443, 92) to (355, 71).
; PLAN: r0=443(x1), r1=92(y1), r2=355(x2), r3=71(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 92
LDI r2, 355
LDI r3, 71
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
