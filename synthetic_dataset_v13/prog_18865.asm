; DESCRIPTION: Renders a yellow line between points (268, 42) and (100, 27).
; PLAN: r0=268(x1), r1=42(y1), r2=100(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 42
LDI r2, 100
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
