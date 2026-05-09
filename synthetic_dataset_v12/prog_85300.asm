; DESCRIPTION: Composite: Sets a single magenta pixel at (95, 186) then Draws a cyan rectangle at (67, 155) with width 68 and height 73.
; PLAN: r0=95(x), r1=186(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=67(x), r6=155(y), r7=68(width), r8=73(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 95
LDI r1, 186
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 67
LDI r6, 155
LDI r7, 68
LDI r8, 73
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
