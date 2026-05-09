; DESCRIPTION: Draws a red line from (341, 95) to (317, 83).
; PLAN: r0=341(x1), r1=95(y1), r2=317(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 341
LDI r1, 95
LDI r2, 317
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
