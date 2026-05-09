; DESCRIPTION: Draws a black line from (77, 246) to (392, 96).
; PLAN: r0=77(x1), r1=246(y1), r2=392(x2), r3=96(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 246
LDI r2, 392
LDI r3, 96
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
