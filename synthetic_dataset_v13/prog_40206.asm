; DESCRIPTION: Draws a red line from (328, 79) to (481, 7).
; PLAN: r0=328(x1), r1=79(y1), r2=481(x2), r3=7(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 79
LDI r2, 481
LDI r3, 7
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
