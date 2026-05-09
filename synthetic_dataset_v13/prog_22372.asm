; DESCRIPTION: Composite: Sets a single white pixel at (49, 92) then Draws a cyan rectangle at (174, 67) with width 91 and height 45.
; PLAN: r0=49(x), r1=92(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=174(x), r6=67(y), r7=91(width), r8=45(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 49
LDI r1, 92
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 174
LDI r6, 67
LDI r7, 91
LDI r8, 45
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
