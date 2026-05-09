; DESCRIPTION: Draws a red line from (14, 46) to (64, 79).
; PLAN: r0=14(x1), r1=46(y1), r2=64(x2), r3=79(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 46
LDI r2, 64
LDI r3, 79
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
