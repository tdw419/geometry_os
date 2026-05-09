; DESCRIPTION: Draws a red line from (30, 109) to (114, 59).
; PLAN: r0=30(x1), r1=109(y1), r2=114(x2), r3=59(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 109
LDI r2, 114
LDI r3, 59
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
