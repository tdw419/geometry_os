; DESCRIPTION: Renders a magenta line between points (38, 42) and (226, 26).
; PLAN: r0=38(x1), r1=42(y1), r2=226(x2), r3=26(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 42
LDI r2, 226
LDI r3, 26
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
