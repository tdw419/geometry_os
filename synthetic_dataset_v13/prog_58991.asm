; DESCRIPTION: Draws a black line from (139, 203) to (387, 240).
; PLAN: r0=139(x1), r1=203(y1), r2=387(x2), r3=240(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 203
LDI r2, 387
LDI r3, 240
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
