; DESCRIPTION: Renders a orange line between points (324, 210) and (226, 241).
; PLAN: r0=324(x1), r1=210(y1), r2=226(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 210
LDI r2, 226
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
