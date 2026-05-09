; DESCRIPTION: Places a red line segment connecting (191, 42) to (504, 74).
; PLAN: r0=191(x1), r1=42(y1), r2=504(x2), r3=74(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 42
LDI r2, 504
LDI r3, 74
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
