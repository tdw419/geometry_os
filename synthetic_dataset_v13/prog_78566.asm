; DESCRIPTION: Draws a red line from (53, 154) to (17, 82).
; PLAN: r0=53(x1), r1=154(y1), r2=17(x2), r3=82(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 154
LDI r2, 17
LDI r3, 82
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
