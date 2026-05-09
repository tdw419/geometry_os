; DESCRIPTION: Renders a yellow line between points (276, 82) and (120, 47).
; PLAN: r0=276(x1), r1=82(y1), r2=120(x2), r3=47(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 82
LDI r2, 120
LDI r3, 47
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
