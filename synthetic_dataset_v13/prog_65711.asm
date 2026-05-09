; DESCRIPTION: Composite: Places a white dot at position (389, 207) then Draws a green rectangle at (186, 0) with width 18 and height 96.
; PLAN: r0=389(x), r1=207(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=186(x), r6=0(y), r7=18(width), r8=96(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 207
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 186
LDI r6, 0
LDI r7, 18
LDI r8, 96
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
