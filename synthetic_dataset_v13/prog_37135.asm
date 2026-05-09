; DESCRIPTION: Renders a yellow line between points (373, 76) and (0, 42).
; PLAN: r0=373(x1), r1=76(y1), r2=0(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 76
LDI r2, 0
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
