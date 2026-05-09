; DESCRIPTION: Draws a red line from (290, 41) to (246, 214).
; PLAN: r0=290(x1), r1=41(y1), r2=246(x2), r3=214(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 41
LDI r2, 246
LDI r3, 214
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
