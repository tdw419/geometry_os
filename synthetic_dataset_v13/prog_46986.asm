; DESCRIPTION: Composite: Creates a white circular shape at (439, 207) with radius 34 then Draws a magenta rectangle at (295, 46) with width 72 and height 100.
; PLAN: r0=439(x), r1=207(y), r2=34(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x), r6=46(y), r7=72(width), r8=100(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 439
LDI r1, 207
LDI r2, 34
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 46
LDI r7, 72
LDI r8, 100
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
