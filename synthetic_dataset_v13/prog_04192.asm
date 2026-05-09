; DESCRIPTION: Composite: Renders a yellow line between points (394, 197) and (238, 52) then Draws a orange circle centered at (93, 99) with radius 37.
; PLAN: r0=394(x1), r1=197(y1), r2=238(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=93(x), r6=99(y), r7=37(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 394
LDI r1, 197
LDI r2, 238
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 99
LDI r7, 37
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
