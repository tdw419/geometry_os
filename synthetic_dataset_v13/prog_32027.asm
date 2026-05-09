; DESCRIPTION: Places a green line segment connecting (123, 133) to (21, 95).
; PLAN: r0=123(x1), r1=133(y1), r2=21(x2), r3=95(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 133
LDI r2, 21
LDI r3, 95
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
