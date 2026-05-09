; DESCRIPTION: Draws a red line from (309, 22) to (365, 165).
; PLAN: r0=309(x1), r1=22(y1), r2=365(x2), r3=165(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 22
LDI r2, 365
LDI r3, 165
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
