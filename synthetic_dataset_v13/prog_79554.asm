; DESCRIPTION: Draws a black line from (245, 207) to (350, 116).
; PLAN: r0=245(x1), r1=207(y1), r2=350(x2), r3=116(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 207
LDI r2, 350
LDI r3, 116
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
