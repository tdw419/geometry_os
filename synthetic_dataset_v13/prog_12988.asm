; DESCRIPTION: Renders a red line between points (268, 94) and (324, 83).
; PLAN: r0=268(x1), r1=94(y1), r2=324(x2), r3=83(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 94
LDI r2, 324
LDI r3, 83
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
