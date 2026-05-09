; DESCRIPTION: Composite: Draws a red circle centered at (304, 82) with radius 64 then Draws a red rectangle at (314, 217) with width 78 and height 21 then Places a white dot at position (170, 241).
; PLAN: r0=304(x), r1=82(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=314(x), r6=217(y), r7=78(width), r8=21(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=170(x), r11=241(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 304
LDI r1, 82
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 314
LDI r6, 217
LDI r7, 78
LDI r8, 21
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 170
LDI r11, 241
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
