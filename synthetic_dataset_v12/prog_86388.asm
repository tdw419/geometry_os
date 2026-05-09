; DESCRIPTION: Draws a red line from (104, 16) to (30, 158).
; PLAN: r0=104(x1), r1=16(y1), r2=30(x2), r3=158(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 16
LDI r2, 30
LDI r3, 158
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
