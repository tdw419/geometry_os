; DESCRIPTION: Draws a black line from (278, 113) to (208, 3).
; PLAN: r0=278(x1), r1=113(y1), r2=208(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 113
LDI r2, 208
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
