; DESCRIPTION: Renders a red line between points (111, 18) and (230, 83).
; PLAN: r0=111(x1), r1=18(y1), r2=230(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 18
LDI r2, 230
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
