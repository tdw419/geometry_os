; DESCRIPTION: Places a black line segment connecting (58, 193) to (220, 61).
; PLAN: r0=58(x1), r1=193(y1), r2=220(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 193
LDI r2, 220
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
