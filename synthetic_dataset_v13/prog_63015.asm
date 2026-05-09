; DESCRIPTION: Draws a red line from (165, 41) to (69, 65).
; PLAN: r0=165(x1), r1=41(y1), r2=69(x2), r3=65(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 41
LDI r2, 69
LDI r3, 65
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
