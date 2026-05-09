; DESCRIPTION: Draws a red line from (82, 206) to (189, 194).
; PLAN: r0=82(x1), r1=206(y1), r2=189(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 82
LDI r1, 206
LDI r2, 189
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
