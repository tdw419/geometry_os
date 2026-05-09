; DESCRIPTION: Composite: Sets a single orange pixel at (214, 18) then Draws a yellow rectangle at (250, 85) with width 72 and height 56.
; PLAN: r0=214(x), r1=18(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=250(x), r6=85(y), r7=72(width), r8=56(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 18
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 250
LDI r6, 85
LDI r7, 72
LDI r8, 56
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
