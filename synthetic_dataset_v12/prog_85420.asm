; DESCRIPTION: Renders a red line between points (267, 197) and (472, 139).
; PLAN: r0=267(x1), r1=197(y1), r2=472(x2), r3=139(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 267
LDI r1, 197
LDI r2, 472
LDI r3, 139
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
