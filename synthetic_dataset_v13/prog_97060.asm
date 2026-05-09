; DESCRIPTION: Places a red line segment connecting (376, 19) to (150, 186).
; PLAN: r0=376(x1), r1=19(y1), r2=150(x2), r3=186(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 19
LDI r2, 150
LDI r3, 186
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
