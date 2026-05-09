; DESCRIPTION: Composite: Places a purple dot at position (488, 36) then Draws a red rectangle at (164, 129) with width 68 and height 78.
; PLAN: r0=488(x), r1=36(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=164(x), r6=129(y), r7=68(width), r8=78(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 488
LDI r1, 36
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 164
LDI r6, 129
LDI r7, 68
LDI r8, 78
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
