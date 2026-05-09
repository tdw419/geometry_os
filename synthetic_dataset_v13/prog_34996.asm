; DESCRIPTION: Composite: Draws a red circle centered at (248, 109) with radius 57 then Places a red 89x65 rectangle at position (359, 177) then Sets a single green pixel at (201, 43).
; PLAN: r0=248(x), r1=109(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=359(x), r6=177(y), r7=89(width), r8=65(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=201(x), r11=43(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 248
LDI r1, 109
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 359
LDI r6, 177
LDI r7, 89
LDI r8, 65
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 201
LDI r11, 43
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
