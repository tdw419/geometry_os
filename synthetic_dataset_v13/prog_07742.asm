; DESCRIPTION: Renders a yellow line between points (141, 15) and (42, 183).
; PLAN: r0=141(x1), r1=15(y1), r2=42(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 15
LDI r2, 42
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
