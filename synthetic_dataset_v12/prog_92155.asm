; DESCRIPTION: Draws a black line from (346, 145) to (376, 3).
; PLAN: r0=346(x1), r1=145(y1), r2=376(x2), r3=3(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 145
LDI r2, 376
LDI r3, 3
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
