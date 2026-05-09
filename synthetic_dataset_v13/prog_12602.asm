; DESCRIPTION: Draws a red line from (425, 156) to (46, 40).
; PLAN: r0=425(x1), r1=156(y1), r2=46(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 156
LDI r2, 46
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
