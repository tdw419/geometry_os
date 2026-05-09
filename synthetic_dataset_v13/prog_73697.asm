; DESCRIPTION: Composite: Sets a single black pixel at (448, 80) then Draws a red rectangle at (266, 4) with width 102 and height 59.
; PLAN: r0=448(x), r1=80(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=266(x), r6=4(y), r7=102(width), r8=59(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 80
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 266
LDI r6, 4
LDI r7, 102
LDI r8, 59
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
