; DESCRIPTION: Draws a red line from (229, 142) to (67, 167).
; PLAN: r0=229(x1), r1=142(y1), r2=67(x2), r3=167(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 142
LDI r2, 67
LDI r3, 167
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
