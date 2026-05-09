; DESCRIPTION: Composite: Places a white circle of radius 45 at center (229, 149) then Draws a blue rectangle at (474, 28) with width 20 and height 70.
; PLAN: r0=229(x), r1=149(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=474(x), r6=28(y), r7=20(width), r8=70(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 149
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 474
LDI r6, 28
LDI r7, 20
LDI r8, 70
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
