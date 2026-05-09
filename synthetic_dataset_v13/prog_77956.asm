; DESCRIPTION: Composite: Creates a red circular shape at (413, 150) with radius 57 then Draws a purple rectangle at (18, 82) with width 41 and height 13 then Places a cyan dot at position (342, 211).
; PLAN: r0=413(x), r1=150(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=18(x), r6=82(y), r7=41(width), r8=13(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=342(x), r11=211(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 413
LDI r1, 150
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 18
LDI r6, 82
LDI r7, 41
LDI r8, 13
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 211
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
