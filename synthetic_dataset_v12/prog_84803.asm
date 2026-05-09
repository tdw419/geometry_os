; DESCRIPTION: Renders a yellow line between points (397, 68) and (42, 172).
; PLAN: r0=397(x1), r1=68(y1), r2=42(x2), r3=172(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 68
LDI r2, 42
LDI r3, 172
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
