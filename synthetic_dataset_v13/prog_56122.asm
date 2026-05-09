; DESCRIPTION: Places a black line segment connecting (46, 40) to (260, 7).
; PLAN: r0=46(x1), r1=40(y1), r2=260(x2), r3=7(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 40
LDI r2, 260
LDI r3, 7
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
