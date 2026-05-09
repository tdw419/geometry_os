; DESCRIPTION: Draws a red line from (464, 73) to (324, 58).
; PLAN: r0=464(x1), r1=73(y1), r2=324(x2), r3=58(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 73
LDI r2, 324
LDI r3, 58
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
