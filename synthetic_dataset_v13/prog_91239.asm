; DESCRIPTION: Composite: Draws a red rectangle at (394, 9) with width 110 and height 15 then Places a yellow dot at position (408, 107).
; PLAN: r0=394(x), r1=9(y), r2=110(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x), r6=107(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 394
LDI r1, 9
LDI r2, 110
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 107
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
