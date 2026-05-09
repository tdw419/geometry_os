; DESCRIPTION: Draws a red line from (498, 84) to (82, 49).
; PLAN: r0=498(x1), r1=84(y1), r2=82(x2), r3=49(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 498
LDI r1, 84
LDI r2, 82
LDI r3, 49
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
