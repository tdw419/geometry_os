; DESCRIPTION: Draws a purple line from (259, 79) to (92, 164).
; PLAN: r0=259(x1), r1=79(y1), r2=92(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 79
LDI r2, 92
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
