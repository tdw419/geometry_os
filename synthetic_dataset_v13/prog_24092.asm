; DESCRIPTION: Composite: Draws a yellow circle centered at (342, 158) with radius 73 then Renders a cyan line between points (376, 28) and (375, 209).
; PLAN: r0=342(x), r1=158(y), r2=73(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=376(x1), r6=28(y1), r7=375(x2), r8=209(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 342
LDI r1, 158
LDI r2, 73
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 376
LDI r6, 28
LDI r7, 375
LDI r8, 209
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
