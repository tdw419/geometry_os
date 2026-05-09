; DESCRIPTION: Composite: Places a orange dot at position (145, 221) then Draws a green rectangle at (41, 107) with width 59 and height 42.
; PLAN: r0=145(x), r1=221(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=41(x), r6=107(y), r7=59(width), r8=42(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 145
LDI r1, 221
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 41
LDI r6, 107
LDI r7, 59
LDI r8, 42
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
