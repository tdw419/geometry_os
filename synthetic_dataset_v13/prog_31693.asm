; DESCRIPTION: Places a black line segment connecting (332, 117) to (260, 93).
; PLAN: r0=332(x1), r1=117(y1), r2=260(x2), r3=93(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 117
LDI r2, 260
LDI r3, 93
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
