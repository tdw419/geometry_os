; DESCRIPTION: Draws a red line from (92, 96) to (422, 61).
; PLAN: r0=92(x1), r1=96(y1), r2=422(x2), r3=61(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 96
LDI r2, 422
LDI r3, 61
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
