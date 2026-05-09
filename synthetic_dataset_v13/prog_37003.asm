; DESCRIPTION: Composite: Places a orange dot at position (90, 163) then Draws a white rectangle at (396, 47) with width 108 and height 38.
; PLAN: r0=90(x), r1=163(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=396(x), r6=47(y), r7=108(width), r8=38(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 90
LDI r1, 163
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 396
LDI r6, 47
LDI r7, 108
LDI r8, 38
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
