; DESCRIPTION: Draws a red line from (265, 242) to (311, 1).
; PLAN: r0=265(x1), r1=242(y1), r2=311(x2), r3=1(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 242
LDI r2, 311
LDI r3, 1
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
