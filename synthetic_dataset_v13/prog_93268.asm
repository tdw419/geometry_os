; DESCRIPTION: Composite: Draws a orange rectangle at (335, 158) with width 117 and height 88 then Places a cyan dot at position (96, 230).
; PLAN: r0=335(x), r1=158(y), r2=117(width), r3=88(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=96(x), r6=230(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 335
LDI r1, 158
LDI r2, 117
LDI r3, 88
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 230
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
