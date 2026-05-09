; DESCRIPTION: Composite: Creates a green rectangular region at (421, 201) spanning 11 by 28 pixels then Renders a yellow line between points (207, 24) and (310, 247) then Places a orange dot at position (225, 121).
; PLAN: r0=421(x), r1=201(y), r2=11(width), r3=28(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x1), r6=24(y1), r7=310(x2), r8=247(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=225(x), r11=121(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 421
LDI r1, 201
LDI r2, 11
LDI r3, 28
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 24
LDI r7, 310
LDI r8, 247
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 225
LDI r11, 121
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
