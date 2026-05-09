; DESCRIPTION: Composite: Draws a cyan rectangle at (335, 107) with width 67 and height 72 then Places a red dot at position (303, 69).
; PLAN: r0=335(x), r1=107(y), r2=67(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=303(x), r6=69(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 335
LDI r1, 107
LDI r2, 67
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 69
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
