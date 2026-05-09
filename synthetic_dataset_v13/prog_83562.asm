; DESCRIPTION: Draws a red line from (333, 156) to (166, 76).
; PLAN: r0=333(x1), r1=156(y1), r2=166(x2), r3=76(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 156
LDI r2, 166
LDI r3, 76
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
