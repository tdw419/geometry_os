; DESCRIPTION: Places a black line segment connecting (346, 3) to (4, 2).
; PLAN: r0=346(x1), r1=3(y1), r2=4(x2), r3=2(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 3
LDI r2, 4
LDI r3, 2
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
