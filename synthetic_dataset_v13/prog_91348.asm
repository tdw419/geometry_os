; DESCRIPTION: Renders a red line between points (248, 63) and (426, 165).
; PLAN: r0=248(x1), r1=63(y1), r2=426(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 63
LDI r2, 426
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
