; DESCRIPTION: Draws a red line from (335, 239) to (93, 19).
; PLAN: r0=335(x1), r1=239(y1), r2=93(x2), r3=19(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 239
LDI r2, 93
LDI r3, 19
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
