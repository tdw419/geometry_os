; DESCRIPTION: Renders a red line between points (111, 6) and (24, 37).
; PLAN: r0=111(x1), r1=6(y1), r2=24(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 6
LDI r2, 24
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
