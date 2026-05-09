; DESCRIPTION: Draws a black line from (377, 57) to (72, 73).
; PLAN: r0=377(x1), r1=57(y1), r2=72(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 57
LDI r2, 72
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
