; DESCRIPTION: Places a cyan line segment connecting (507, 55) to (351, 168).
; PLAN: r0=507(x1), r1=55(y1), r2=351(x2), r3=168(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 55
LDI r2, 351
LDI r3, 168
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
