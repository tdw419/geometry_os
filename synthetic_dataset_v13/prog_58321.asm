; DESCRIPTION: Composite: Places a black circle of radius 51 at center (178, 120) then Places a orange 25x98 rectangle at position (276, 103) then Places a orange dot at position (370, 34).
; PLAN: r0=178(x), r1=120(y), r2=51(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=276(x), r6=103(y), r7=25(width), r8=98(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=370(x), r11=34(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 178
LDI r1, 120
LDI r2, 51
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 276
LDI r6, 103
LDI r7, 25
LDI r8, 98
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 370
LDI r11, 34
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
