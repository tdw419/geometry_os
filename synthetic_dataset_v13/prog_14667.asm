; DESCRIPTION: Composite: Draws a white circle centered at (100, 124) with radius 48 then Draws a cyan rectangle at (358, 61) with width 110 and height 107.
; PLAN: r0=100(x), r1=124(y), r2=48(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=358(x), r6=61(y), r7=110(width), r8=107(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 100
LDI r1, 124
LDI r2, 48
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 358
LDI r6, 61
LDI r7, 110
LDI r8, 107
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
