; DESCRIPTION: Composite: Places a yellow dot at position (157, 110) then Draws a cyan rectangle at (167, 107) with width 34 and height 34.
; PLAN: r0=157(x), r1=110(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=167(x), r6=107(y), r7=34(width), r8=34(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 157
LDI r1, 110
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 167
LDI r6, 107
LDI r7, 34
LDI r8, 34
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
