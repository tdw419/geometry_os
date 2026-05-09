; DESCRIPTION: Places a red line segment connecting (0, 50) to (219, 46).
; PLAN: r0=0(x1), r1=50(y1), r2=219(x2), r3=46(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 50
LDI r2, 219
LDI r3, 46
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
