; DESCRIPTION: Draws a cyan line from (484, 22) to (507, 0).
; PLAN: r0=484(x1), r1=22(y1), r2=507(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 22
LDI r2, 507
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
