; DESCRIPTION: Places a black line segment connecting (426, 215) to (95, 84).
; PLAN: r0=426(x1), r1=215(y1), r2=95(x2), r3=84(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 215
LDI r2, 95
LDI r3, 84
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
