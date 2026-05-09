; DESCRIPTION: Composite: Sets a single yellow pixel at (270, 154) then Draws a orange rectangle at (142, 75) with width 71 and height 103.
; PLAN: r0=270(x), r1=154(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=142(x), r6=75(y), r7=71(width), r8=103(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 270
LDI r1, 154
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 142
LDI r6, 75
LDI r7, 71
LDI r8, 103
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
