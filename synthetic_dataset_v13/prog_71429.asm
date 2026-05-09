; DESCRIPTION: Composite: Places a purple dot at position (337, 238) then Renders a yellow line between points (320, 148) and (212, 220).
; PLAN: r0=337(x), r1=238(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=320(x1), r6=148(y1), r7=212(x2), r8=220(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 238
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 148
LDI r7, 212
LDI r8, 220
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
