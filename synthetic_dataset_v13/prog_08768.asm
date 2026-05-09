; DESCRIPTION: Draws a black line from (92, 103) to (343, 202).
; PLAN: r0=92(x1), r1=103(y1), r2=343(x2), r3=202(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 103
LDI r2, 343
LDI r3, 202
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
