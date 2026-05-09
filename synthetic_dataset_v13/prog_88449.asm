; DESCRIPTION: Composite: Places a white dot at position (126, 174) then Draws a orange rectangle at (168, 100) with width 90 and height 61.
; PLAN: r0=126(x), r1=174(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=168(x), r6=100(y), r7=90(width), r8=61(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 126
LDI r1, 174
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 168
LDI r6, 100
LDI r7, 90
LDI r8, 61
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
