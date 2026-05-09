; DESCRIPTION: Renders a red line between points (92, 42) and (32, 53).
; PLAN: r0=92(x1), r1=42(y1), r2=32(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 42
LDI r2, 32
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
