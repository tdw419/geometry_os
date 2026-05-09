; DESCRIPTION: Draws a black line from (80, 21) to (137, 14).
; PLAN: r0=80(x1), r1=21(y1), r2=137(x2), r3=14(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 21
LDI r2, 137
LDI r3, 14
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
