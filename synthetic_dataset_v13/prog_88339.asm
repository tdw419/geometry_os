; DESCRIPTION: Places a black line segment connecting (186, 38) to (445, 90).
; PLAN: r0=186(x1), r1=38(y1), r2=445(x2), r3=90(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 38
LDI r2, 445
LDI r3, 90
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
