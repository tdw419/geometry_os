; DESCRIPTION: Renders a orange line between points (111, 40) and (317, 7).
; PLAN: r0=111(x1), r1=40(y1), r2=317(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 40
LDI r2, 317
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
