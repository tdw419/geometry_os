; DESCRIPTION: Draws a red line from (382, 247) to (86, 172).
; PLAN: r0=382(x1), r1=247(y1), r2=86(x2), r3=172(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 247
LDI r2, 86
LDI r3, 172
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
