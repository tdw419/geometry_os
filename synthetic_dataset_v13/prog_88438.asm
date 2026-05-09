; DESCRIPTION: Renders a blue line between points (343, 42) and (16, 120).
; PLAN: r0=343(x1), r1=42(y1), r2=16(x2), r3=120(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 42
LDI r2, 16
LDI r3, 120
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
