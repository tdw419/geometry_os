; DESCRIPTION: Draws a red line from (303, 152) to (229, 41).
; PLAN: r0=303(x1), r1=152(y1), r2=229(x2), r3=41(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 152
LDI r2, 229
LDI r3, 41
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
