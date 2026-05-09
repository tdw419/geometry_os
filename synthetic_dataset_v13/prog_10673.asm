; DESCRIPTION: Renders a orange line between points (75, 146) and (296, 214).
; PLAN: r0=75(x1), r1=146(y1), r2=296(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 146
LDI r2, 296
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
