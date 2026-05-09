; DESCRIPTION: Places a cyan line segment connecting (292, 31) to (34, 169).
; PLAN: r0=292(x1), r1=31(y1), r2=34(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 31
LDI r2, 34
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
