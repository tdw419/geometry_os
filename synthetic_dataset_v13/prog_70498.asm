; DESCRIPTION: Composite: Sets a single orange pixel at (290, 5) then Draws a red rectangle at (340, 144) with width 20 and height 71.
; PLAN: r0=290(x), r1=5(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=340(x), r6=144(y), r7=20(width), r8=71(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 290
LDI r1, 5
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 340
LDI r6, 144
LDI r7, 20
LDI r8, 71
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
