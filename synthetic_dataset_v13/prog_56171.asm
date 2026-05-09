; DESCRIPTION: Renders a red line between points (139, 242) and (267, 30).
; PLAN: r0=139(x1), r1=242(y1), r2=267(x2), r3=30(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 242
LDI r2, 267
LDI r3, 30
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
