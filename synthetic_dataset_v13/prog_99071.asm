; DESCRIPTION: Places a purple line segment connecting (152, 240) to (443, 36).
; PLAN: r0=152(x1), r1=240(y1), r2=443(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 240
LDI r2, 443
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
