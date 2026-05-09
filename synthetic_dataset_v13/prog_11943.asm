; DESCRIPTION: Draws a red line from (95, 189) to (91, 206).
; PLAN: r0=95(x1), r1=189(y1), r2=91(x2), r3=206(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 189
LDI r2, 91
LDI r3, 206
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
