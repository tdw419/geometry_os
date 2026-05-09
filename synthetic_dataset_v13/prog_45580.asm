; DESCRIPTION: Renders a orange line between points (111, 82) and (268, 241).
; PLAN: r0=111(x1), r1=82(y1), r2=268(x2), r3=241(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 82
LDI r2, 268
LDI r3, 241
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
