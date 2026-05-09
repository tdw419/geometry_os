; DESCRIPTION: Draws a black line from (179, 113) to (92, 150).
; PLAN: r0=179(x1), r1=113(y1), r2=92(x2), r3=150(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 113
LDI r2, 92
LDI r3, 150
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
