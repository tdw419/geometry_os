; DESCRIPTION: Renders a orange line between points (344, 107) and (426, 214).
; PLAN: r0=344(x1), r1=107(y1), r2=426(x2), r3=214(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 344
LDI r1, 107
LDI r2, 426
LDI r3, 214
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
