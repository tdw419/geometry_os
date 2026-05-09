; DESCRIPTION: Places a black line segment connecting (123, 154) to (35, 35).
; PLAN: r0=123(x1), r1=154(y1), r2=35(x2), r3=35(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 154
LDI r2, 35
LDI r3, 35
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
