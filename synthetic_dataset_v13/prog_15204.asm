; DESCRIPTION: Renders a red line between points (457, 32) and (104, 42).
; PLAN: r0=457(x1), r1=32(y1), r2=104(x2), r3=42(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 457
LDI r1, 32
LDI r2, 104
LDI r3, 42
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
