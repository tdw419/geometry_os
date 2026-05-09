; DESCRIPTION: Composite: Creates a purple rectangular region at (67, 45) spanning 112 by 74 pixels then Renders a red line between points (448, 81) and (487, 61).
; PLAN: r0=67(x), r1=45(y), r2=112(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=448(x1), r6=81(y1), r7=487(x2), r8=61(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 67
LDI r1, 45
LDI r2, 112
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 448
LDI r6, 81
LDI r7, 487
LDI r8, 61
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
