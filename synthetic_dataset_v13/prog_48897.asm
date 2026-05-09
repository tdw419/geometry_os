; DESCRIPTION: Places a black line segment connecting (64, 13) to (249, 166).
; PLAN: r0=64(x1), r1=13(y1), r2=249(x2), r3=166(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 13
LDI r2, 249
LDI r3, 166
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
