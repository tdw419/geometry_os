; DESCRIPTION: Draws a red line from (182, 56) to (26, 108).
; PLAN: r0=182(x1), r1=56(y1), r2=26(x2), r3=108(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 56
LDI r2, 26
LDI r3, 108
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
