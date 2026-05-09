; DESCRIPTION: Renders a yellow line between points (345, 42) and (156, 155).
; PLAN: r0=345(x1), r1=42(y1), r2=156(x2), r3=155(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 42
LDI r2, 156
LDI r3, 155
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
