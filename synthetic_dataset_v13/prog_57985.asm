; DESCRIPTION: Renders a orange line between points (410, 24) and (493, 54).
; PLAN: r0=410(x1), r1=24(y1), r2=493(x2), r3=54(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 24
LDI r2, 493
LDI r3, 54
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
