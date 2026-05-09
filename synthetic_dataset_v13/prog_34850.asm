; DESCRIPTION: Places a white line segment connecting (196, 234) to (507, 187).
; PLAN: r0=196(x1), r1=234(y1), r2=507(x2), r3=187(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 234
LDI r2, 507
LDI r3, 187
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
