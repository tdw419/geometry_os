; DESCRIPTION: Draws a orange line from (306, 247) to (138, 167).
; PLAN: r0=306(x1), r1=247(y1), r2=138(x2), r3=167(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 247
LDI r2, 138
LDI r3, 167
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
