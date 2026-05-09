; DESCRIPTION: Composite: Draws a yellow circle centered at (83, 118) with radius 74 then Places a green 31x15 rectangle at position (445, 186) then Places a yellow dot at position (69, 159).
; PLAN: r0=83(x), r1=118(y), r2=74(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=445(x), r6=186(y), r7=31(width), r8=15(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=69(x), r11=159(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 83
LDI r1, 118
LDI r2, 74
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 445
LDI r6, 186
LDI r7, 31
LDI r8, 15
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 69
LDI r11, 159
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
