; DESCRIPTION: Draws a black line from (278, 72) to (373, 33).
; PLAN: r0=278(x1), r1=72(y1), r2=373(x2), r3=33(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 72
LDI r2, 373
LDI r3, 33
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
