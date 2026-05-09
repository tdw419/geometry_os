; DESCRIPTION: Draws a white line from (507, 67) to (259, 178).
; PLAN: r0=507(x1), r1=67(y1), r2=259(x2), r3=178(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 507
LDI r1, 67
LDI r2, 259
LDI r3, 178
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
