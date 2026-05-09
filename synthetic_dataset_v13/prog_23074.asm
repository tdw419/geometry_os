; DESCRIPTION: Composite: Sets a single green pixel at (400, 83) then Draws a white rectangle at (375, 113) with width 19 and height 99.
; PLAN: r0=400(x), r1=83(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=375(x), r6=113(y), r7=19(width), r8=99(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 400
LDI r1, 83
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 375
LDI r6, 113
LDI r7, 19
LDI r8, 99
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
