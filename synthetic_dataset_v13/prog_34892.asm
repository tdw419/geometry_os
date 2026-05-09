; DESCRIPTION: Composite: Sets a single red pixel at (259, 135) then Draws a white rectangle at (200, 20) with width 119 and height 27.
; PLAN: r0=259(x), r1=135(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=200(x), r6=20(y), r7=119(width), r8=27(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 259
LDI r1, 135
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 200
LDI r6, 20
LDI r7, 119
LDI r8, 27
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
