; DESCRIPTION: Composite: Draws a white rectangle at (220, 17) with width 72 and height 42 then Places a white dot at position (289, 93).
; PLAN: r0=220(x), r1=17(y), r2=72(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=289(x), r6=93(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 220
LDI r1, 17
LDI r2, 72
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 93
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
