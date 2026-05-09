; DESCRIPTION: Composite: Places a red 117x62 rectangle at position (261, 37) then Draws a white circle centered at (275, 92) with radius 39.
; PLAN: r0=261(x), r1=37(y), r2=117(width), r3=62(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=275(x), r6=92(y), r7=39(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 261
LDI r1, 37
LDI r2, 117
LDI r3, 62
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 92
LDI r7, 39
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
