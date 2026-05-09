; DESCRIPTION: Places a cyan line segment connecting (507, 90) to (251, 237).
; PLAN: r0=507(x1), r1=90(y1), r2=251(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 90
LDI r2, 251
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
