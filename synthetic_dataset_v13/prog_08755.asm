; DESCRIPTION: Draws a red line from (182, 187) to (385, 169).
; PLAN: r0=182(x1), r1=187(y1), r2=385(x2), r3=169(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 187
LDI r2, 385
LDI r3, 169
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
