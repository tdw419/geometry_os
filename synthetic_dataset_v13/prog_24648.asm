; DESCRIPTION: Draws a red line from (30, 2) to (46, 155).
; PLAN: r0=30(x1), r1=2(y1), r2=46(x2), r3=155(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 2
LDI r2, 46
LDI r3, 155
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
