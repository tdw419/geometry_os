; DESCRIPTION: Draws a black line from (92, 94) to (442, 56).
; PLAN: r0=92(x1), r1=94(y1), r2=442(x2), r3=56(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 94
LDI r2, 442
LDI r3, 56
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
