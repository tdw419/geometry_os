; DESCRIPTION: Composite: Creates a magenta circular shape at (80, 207) with radius 19 then Draws a magenta rectangle at (238, 149) with width 105 and height 77.
; PLAN: r0=80(x), r1=207(y), r2=19(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=238(x), r6=149(y), r7=105(width), r8=77(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 80
LDI r1, 207
LDI r2, 19
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 238
LDI r6, 149
LDI r7, 105
LDI r8, 77
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
