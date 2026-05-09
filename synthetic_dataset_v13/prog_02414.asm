; DESCRIPTION: Renders a yellow line between points (19, 30) and (182, 42).
; PLAN: r0=19(x1), r1=30(y1), r2=182(x2), r3=42(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 30
LDI r2, 182
LDI r3, 42
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
