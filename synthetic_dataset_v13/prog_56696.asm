; DESCRIPTION: Composite: Draws a green rectangle at (2, 37) with width 85 and height 20 then Places a green dot at position (415, 40).
; PLAN: r0=2(x), r1=37(y), r2=85(width), r3=20(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=40(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 2
LDI r1, 37
LDI r2, 85
LDI r3, 20
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 40
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
