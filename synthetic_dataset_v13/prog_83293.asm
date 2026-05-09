; DESCRIPTION: Draws a black line from (137, 46) to (496, 242).
; PLAN: r0=137(x1), r1=46(y1), r2=496(x2), r3=242(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 46
LDI r2, 496
LDI r3, 242
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
