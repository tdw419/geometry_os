; DESCRIPTION: Composite: Draws a cyan rectangle at (380, 177) with width 77 and height 78 then Places a yellow dot at position (325, 170).
; PLAN: r0=380(x), r1=177(y), r2=77(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=325(x), r6=170(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 380
LDI r1, 177
LDI r2, 77
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 325
LDI r6, 170
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
