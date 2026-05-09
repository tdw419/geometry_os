; DESCRIPTION: Composite: Places a white line segment connecting (204, 62) to (188, 78) then Draws a cyan rectangle at (467, 29) with width 18 and height 61.
; PLAN: r0=204(x1), r1=62(y1), r2=188(x2), r3=78(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=467(x), r6=29(y), r7=18(width), r8=61(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 204
LDI r1, 62
LDI r2, 188
LDI r3, 78
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 467
LDI r6, 29
LDI r7, 18
LDI r8, 61
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
