; DESCRIPTION: Draws a black line from (184, 137) to (92, 13).
; PLAN: r0=184(x1), r1=137(y1), r2=92(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 137
LDI r2, 92
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
