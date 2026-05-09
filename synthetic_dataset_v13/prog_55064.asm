; DESCRIPTION: Places a cyan line segment connecting (169, 47) to (47, 41).
; PLAN: r0=169(x1), r1=47(y1), r2=47(x2), r3=41(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 47
LDI r2, 47
LDI r3, 41
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
