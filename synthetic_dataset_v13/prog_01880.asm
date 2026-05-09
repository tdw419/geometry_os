; DESCRIPTION: Draws a red line from (452, 71) to (178, 37).
; PLAN: r0=452(x1), r1=71(y1), r2=178(x2), r3=37(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 452
LDI r1, 71
LDI r2, 178
LDI r3, 37
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
