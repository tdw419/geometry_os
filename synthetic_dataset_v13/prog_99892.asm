; DESCRIPTION: Places a black line segment connecting (50, 108) to (108, 156).
; PLAN: r0=50(x1), r1=108(y1), r2=108(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 108
LDI r2, 108
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
