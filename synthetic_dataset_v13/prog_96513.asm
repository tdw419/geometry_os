; DESCRIPTION: Places a black line segment connecting (381, 63) to (211, 150).
; PLAN: r0=381(x1), r1=63(y1), r2=211(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 63
LDI r2, 211
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
