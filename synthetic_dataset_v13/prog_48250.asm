; DESCRIPTION: Composite: Places a green circle of radius 77 at center (399, 95) then Draws a cyan rectangle at (89, 139) with width 106 and height 112.
; PLAN: r0=399(x), r1=95(y), r2=77(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=89(x), r6=139(y), r7=106(width), r8=112(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 399
LDI r1, 95
LDI r2, 77
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 89
LDI r6, 139
LDI r7, 106
LDI r8, 112
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
