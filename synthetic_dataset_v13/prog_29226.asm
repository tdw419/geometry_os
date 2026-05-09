; DESCRIPTION: Renders a red line between points (497, 242) and (300, 43).
; PLAN: r0=497(x1), r1=242(y1), r2=300(x2), r3=43(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 242
LDI r2, 300
LDI r3, 43
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
