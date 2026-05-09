; DESCRIPTION: Renders a yellow line between points (372, 238) and (376, 187).
; PLAN: r0=372(x1), r1=238(y1), r2=376(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 238
LDI r2, 376
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
