; DESCRIPTION: Renders a magenta line between points (42, 39) and (55, 42).
; PLAN: r0=42(x1), r1=39(y1), r2=55(x2), r3=42(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 39
LDI r2, 55
LDI r3, 42
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
