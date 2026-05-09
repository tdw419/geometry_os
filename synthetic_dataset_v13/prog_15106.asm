; DESCRIPTION: Composite: Draws a blue rectangle at (188, 190) with width 35 and height 18 then Places a white dot at position (456, 147).
; PLAN: r0=188(x), r1=190(y), r2=35(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=456(x), r6=147(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 188
LDI r1, 190
LDI r2, 35
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 456
LDI r6, 147
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
