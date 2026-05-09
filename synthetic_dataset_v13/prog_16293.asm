; DESCRIPTION: Places a black line segment connecting (214, 207) to (117, 148).
; PLAN: r0=214(x1), r1=207(y1), r2=117(x2), r3=148(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 207
LDI r2, 117
LDI r3, 148
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
