; DESCRIPTION: Draws a black line from (112, 72) to (333, 131).
; PLAN: r0=112(x1), r1=72(y1), r2=333(x2), r3=131(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 72
LDI r2, 333
LDI r3, 131
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
