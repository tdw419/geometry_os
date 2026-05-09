; DESCRIPTION: Places a cyan line segment connecting (507, 47) to (334, 218).
; PLAN: r0=507(x1), r1=47(y1), r2=334(x2), r3=218(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 47
LDI r2, 334
LDI r3, 218
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
