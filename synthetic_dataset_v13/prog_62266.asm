; DESCRIPTION: Draws a white line from (301, 80) to (507, 179).
; PLAN: r0=301(x1), r1=80(y1), r2=507(x2), r3=179(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 80
LDI r2, 507
LDI r3, 179
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
