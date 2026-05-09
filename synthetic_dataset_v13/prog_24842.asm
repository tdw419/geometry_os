; DESCRIPTION: Composite: Draws a red circle centered at (51, 93) with radius 33 then Places a red 120x21 rectangle at position (325, 173) then Sets a single green pixel at (370, 159).
; PLAN: r0=51(x), r1=93(y), r2=33(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=325(x), r6=173(y), r7=120(width), r8=21(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=370(x), r11=159(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 51
LDI r1, 93
LDI r2, 33
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 325
LDI r6, 173
LDI r7, 120
LDI r8, 21
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 159
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
