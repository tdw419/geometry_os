; DESCRIPTION: Places a black line segment connecting (442, 31) to (249, 182).
; PLAN: r0=442(x1), r1=31(y1), r2=249(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 31
LDI r2, 249
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
