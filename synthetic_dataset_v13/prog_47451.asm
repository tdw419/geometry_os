; DESCRIPTION: Places a black line segment connecting (328, 213) to (163, 72).
; PLAN: r0=328(x1), r1=213(y1), r2=163(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 213
LDI r2, 163
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
