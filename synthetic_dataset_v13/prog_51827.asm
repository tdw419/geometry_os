; DESCRIPTION: Renders a red line between points (489, 42) and (201, 109).
; PLAN: r0=489(x1), r1=42(y1), r2=201(x2), r3=109(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 489
LDI r1, 42
LDI r2, 201
LDI r3, 109
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
