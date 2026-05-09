; DESCRIPTION: Draws a red line from (238, 43) to (407, 242).
; PLAN: r0=238(x1), r1=43(y1), r2=407(x2), r3=242(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 43
LDI r2, 407
LDI r3, 242
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
