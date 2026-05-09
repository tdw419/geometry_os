; DESCRIPTION: Draws a red line from (92, 113) to (263, 191).
; PLAN: r0=92(x1), r1=113(y1), r2=263(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 113
LDI r2, 263
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
