; DESCRIPTION: Draws a red line from (274, 32) to (120, 247).
; PLAN: r0=274(x1), r1=32(y1), r2=120(x2), r3=247(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 32
LDI r2, 120
LDI r3, 247
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
