; DESCRIPTION: Composite: Places a blue dot at position (22, 239) then Draws a red rectangle at (221, 149) with width 118 and height 78.
; PLAN: r0=22(x), r1=239(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=149(y), r7=118(width), r8=78(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 22
LDI r1, 239
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 221
LDI r6, 149
LDI r7, 118
LDI r8, 78
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
