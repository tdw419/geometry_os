; DESCRIPTION: Places a black line segment connecting (328, 9) to (353, 193).
; PLAN: r0=328(x1), r1=9(y1), r2=353(x2), r3=193(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 9
LDI r2, 353
LDI r3, 193
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
