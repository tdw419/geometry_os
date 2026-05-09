; DESCRIPTION: Places a red line segment connecting (152, 58) to (333, 122).
; PLAN: r0=152(x1), r1=58(y1), r2=333(x2), r3=122(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 58
LDI r2, 333
LDI r3, 122
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
