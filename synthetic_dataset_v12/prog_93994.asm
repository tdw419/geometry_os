; DESCRIPTION: Draws a red line from (352, 100) to (327, 88).
; PLAN: r0=352(x1), r1=100(y1), r2=327(x2), r3=88(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 100
LDI r2, 327
LDI r3, 88
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
