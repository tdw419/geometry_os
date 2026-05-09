; DESCRIPTION: Renders a orange line between points (230, 93) and (370, 138).
; PLAN: r0=230(x1), r1=93(y1), r2=370(x2), r3=138(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 93
LDI r2, 370
LDI r3, 138
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
