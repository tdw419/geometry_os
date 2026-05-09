; DESCRIPTION: Composite: Draws a red rectangle at (331, 113) with width 103 and height 53 then Sets a single orange pixel at (445, 56).
; PLAN: r0=331(x), r1=113(y), r2=103(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=445(x), r6=56(y), r7=0xFF8800(color). Op: PSET r5, r6, r7.
LDI r0, 331
LDI r1, 113
LDI r2, 103
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 445
LDI r6, 56
LDI r7, 0xFF8800
PSET r5, r6, r7
HALT
