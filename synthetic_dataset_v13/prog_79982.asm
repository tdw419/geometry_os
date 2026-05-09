; DESCRIPTION: Draws a red line from (333, 73) to (357, 82).
; PLAN: r0=333(x1), r1=73(y1), r2=357(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 73
LDI r2, 357
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
