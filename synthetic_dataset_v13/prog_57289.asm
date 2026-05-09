; DESCRIPTION: Composite: Draws a red circle centered at (287, 149) with radius 77 then Draws a green rectangle at (280, 118) with width 80 and height 92.
; PLAN: r0=287(x), r1=149(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=280(x), r6=118(y), r7=80(width), r8=92(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 287
LDI r1, 149
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 280
LDI r6, 118
LDI r7, 80
LDI r8, 92
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
