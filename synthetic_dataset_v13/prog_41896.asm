; DESCRIPTION: Composite: Sets a single orange pixel at (110, 0) then Draws a red rectangle at (32, 2) with width 91 and height 106.
; PLAN: r0=110(x), r1=0(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=32(x), r6=2(y), r7=91(width), r8=106(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 110
LDI r1, 0
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 32
LDI r6, 2
LDI r7, 91
LDI r8, 106
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
