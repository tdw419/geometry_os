; DESCRIPTION: Renders a orange line between points (274, 131) and (230, 50).
; PLAN: r0=274(x1), r1=131(y1), r2=230(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 131
LDI r2, 230
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
