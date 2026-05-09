; DESCRIPTION: Draws a red line from (125, 84) to (269, 73).
; PLAN: r0=125(x1), r1=84(y1), r2=269(x2), r3=73(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 84
LDI r2, 269
LDI r3, 73
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
