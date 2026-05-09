; DESCRIPTION: Draws a red line from (310, 59) to (122, 233).
; PLAN: r0=310(x1), r1=59(y1), r2=122(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 59
LDI r2, 122
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
