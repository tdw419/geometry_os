; DESCRIPTION: Draws a black line from (354, 17) to (22, 32).
; PLAN: r0=354(x1), r1=17(y1), r2=22(x2), r3=32(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 17
LDI r2, 22
LDI r3, 32
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
