; DESCRIPTION: Composite: Sets a single orange pixel at (454, 74) then Draws a orange rectangle at (98, 47) with width 39 and height 74.
; PLAN: r0=454(x), r1=74(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=98(x), r6=47(y), r7=39(width), r8=74(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 454
LDI r1, 74
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 98
LDI r6, 47
LDI r7, 39
LDI r8, 74
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
