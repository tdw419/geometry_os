; DESCRIPTION: Draws a black line from (92, 248) to (221, 140).
; PLAN: r0=92(x1), r1=248(y1), r2=221(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 248
LDI r2, 221
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
