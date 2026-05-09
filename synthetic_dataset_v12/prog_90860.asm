; DESCRIPTION: Places a red line segment connecting (271, 250) to (134, 50).
; PLAN: r0=271(x1), r1=250(y1), r2=134(x2), r3=50(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 250
LDI r2, 134
LDI r3, 50
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
