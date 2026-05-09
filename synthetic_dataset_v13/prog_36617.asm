; DESCRIPTION: Places a black line segment connecting (98, 113) to (407, 95).
; PLAN: r0=98(x1), r1=113(y1), r2=407(x2), r3=95(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 113
LDI r2, 407
LDI r3, 95
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
