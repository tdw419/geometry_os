; DESCRIPTION: Composite: Places a purple dot at position (125, 137) then Draws a orange rectangle at (289, 62) with width 120 and height 111 then Places a yellow circle of radius 75 at center (297, 119).
; PLAN: r0=125(x), r1=137(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=289(x), r6=62(y), r7=120(width), r8=111(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=297(x), r11=119(y), r12=75(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 125
LDI r1, 137
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 289
LDI r6, 62
LDI r7, 120
LDI r8, 111
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 119
LDI r12, 75
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
