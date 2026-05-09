; DESCRIPTION: Renders a yellow line between points (167, 42) and (194, 33).
; PLAN: r0=167(x1), r1=42(y1), r2=194(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 42
LDI r2, 194
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
