; DESCRIPTION: Draws a black line from (86, 73) to (285, 169).
; PLAN: r0=86(x1), r1=73(y1), r2=285(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 73
LDI r2, 285
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
