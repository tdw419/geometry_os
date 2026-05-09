; DESCRIPTION: Composite: Draws a green rectangle at (362, 106) with width 98 and height 104 then Sets a single white pixel at (439, 254).
; PLAN: r0=362(x), r1=106(y), r2=98(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=439(x), r6=254(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 362
LDI r1, 106
LDI r2, 98
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 439
LDI r6, 254
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
