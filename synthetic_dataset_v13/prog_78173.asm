; DESCRIPTION: Composite: Draws a cyan circle centered at (80, 73) with radius 31 then Draws a blue rectangle at (298, 103) with width 40 and height 76.
; PLAN: r0=80(x), r1=73(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=298(x), r6=103(y), r7=40(width), r8=76(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 73
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 298
LDI r6, 103
LDI r7, 40
LDI r8, 76
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
