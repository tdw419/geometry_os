; DESCRIPTION: Draws a red line from (436, 206) to (81, 189).
; PLAN: r0=436(x1), r1=206(y1), r2=81(x2), r3=189(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 206
LDI r2, 81
LDI r3, 189
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
