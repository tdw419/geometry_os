; DESCRIPTION: Composite: Places a green circle of radius 72 at center (431, 134) then Draws a cyan rectangle at (268, 124) with width 34 and height 20.
; PLAN: r0=431(x), r1=134(y), r2=72(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=268(x), r6=124(y), r7=34(width), r8=20(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 134
LDI r2, 72
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 268
LDI r6, 124
LDI r7, 34
LDI r8, 20
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
