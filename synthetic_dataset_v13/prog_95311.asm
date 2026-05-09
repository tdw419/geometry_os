; DESCRIPTION: Composite: Places a green dot at position (415, 141) then Draws a red rectangle at (203, 67) with width 45 and height 51.
; PLAN: r0=415(x), r1=141(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=203(x), r6=67(y), r7=45(width), r8=51(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 415
LDI r1, 141
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 203
LDI r6, 67
LDI r7, 45
LDI r8, 51
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
