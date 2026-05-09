; DESCRIPTION: Renders a red line between points (486, 214) and (367, 105).
; PLAN: r0=486(x1), r1=214(y1), r2=367(x2), r3=105(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 214
LDI r2, 367
LDI r3, 105
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
