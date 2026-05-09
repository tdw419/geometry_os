; DESCRIPTION: Composite: Places a orange dot at position (73, 245) then Draws a magenta rectangle at (133, 196) with width 40 and height 45.
; PLAN: r0=73(x), r1=245(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=133(x), r6=196(y), r7=40(width), r8=45(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 245
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 133
LDI r6, 196
LDI r7, 40
LDI r8, 45
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
