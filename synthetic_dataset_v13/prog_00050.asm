; DESCRIPTION: Places a black line segment connecting (121, 154) to (70, 104).
; PLAN: r0=121(x1), r1=154(y1), r2=70(x2), r3=104(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 154
LDI r2, 70
LDI r3, 104
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
