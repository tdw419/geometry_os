; DESCRIPTION: Draws a red line from (389, 18) to (280, 73).
; PLAN: r0=389(x1), r1=18(y1), r2=280(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 18
LDI r2, 280
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
