; DESCRIPTION: Composite: Sets a single green pixel at (234, 83) then Draws a green rectangle at (80, 95) with width 71 and height 60.
; PLAN: r0=234(x), r1=83(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=80(x), r6=95(y), r7=71(width), r8=60(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 234
LDI r1, 83
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 80
LDI r6, 95
LDI r7, 71
LDI r8, 60
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
