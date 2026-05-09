; DESCRIPTION: Draws a red line from (239, 145) to (311, 139).
; PLAN: r0=239(x1), r1=145(y1), r2=311(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 145
LDI r2, 311
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
