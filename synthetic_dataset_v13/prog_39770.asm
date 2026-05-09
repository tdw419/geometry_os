; DESCRIPTION: Composite: Places a yellow dot at position (489, 175) then Draws a cyan rectangle at (51, 16) with width 75 and height 31.
; PLAN: r0=489(x), r1=175(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=51(x), r6=16(y), r7=75(width), r8=31(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 489
LDI r1, 175
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 51
LDI r6, 16
LDI r7, 75
LDI r8, 31
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
