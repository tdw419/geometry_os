; DESCRIPTION: Composite: Places a white dot at position (205, 248) then Draws a cyan rectangle at (389, 28) with width 19 and height 102.
; PLAN: r0=205(x), r1=248(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=389(x), r6=28(y), r7=19(width), r8=102(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 248
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 389
LDI r6, 28
LDI r7, 19
LDI r8, 102
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
