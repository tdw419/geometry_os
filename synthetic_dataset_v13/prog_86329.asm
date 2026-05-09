; DESCRIPTION: Composite: Places a yellow dot at position (438, 221) then Draws a black rectangle at (373, 87) with width 78 and height 91.
; PLAN: r0=438(x), r1=221(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=373(x), r6=87(y), r7=78(width), r8=91(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 438
LDI r1, 221
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 373
LDI r6, 87
LDI r7, 78
LDI r8, 91
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
