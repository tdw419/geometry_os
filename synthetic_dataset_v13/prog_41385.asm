; DESCRIPTION: Renders a orange line between points (146, 248) and (370, 74).
; PLAN: r0=146(x1), r1=248(y1), r2=370(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 248
LDI r2, 370
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
