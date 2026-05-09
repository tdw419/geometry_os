; DESCRIPTION: Draws a white line from (238, 95) to (156, 198).
; PLAN: r0=238(x1), r1=95(y1), r2=156(x2), r3=198(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 95
LDI r2, 156
LDI r3, 198
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
