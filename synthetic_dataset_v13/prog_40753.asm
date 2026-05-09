; DESCRIPTION: Composite: Sets a single yellow pixel at (96, 221) then Draws a cyan rectangle at (19, 29) with width 15 and height 29.
; PLAN: r0=96(x), r1=221(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=19(x), r6=29(y), r7=15(width), r8=29(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 96
LDI r1, 221
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 19
LDI r6, 29
LDI r7, 15
LDI r8, 29
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
