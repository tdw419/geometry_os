; DESCRIPTION: Composite: Places a orange dot at position (318, 15) then Places a white 91x34 rectangle at position (325, 88).
; PLAN: r0=318(x), r1=15(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=325(x), r6=88(y), r7=91(width), r8=34(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 318
LDI r1, 15
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 325
LDI r6, 88
LDI r7, 91
LDI r8, 34
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
