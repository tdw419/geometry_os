; DESCRIPTION: Composite: Draws a cyan circle centered at (360, 133) with radius 70 then Draws a white rectangle at (337, 145) with width 27 and height 37.
; PLAN: r0=360(x), r1=133(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=337(x), r6=145(y), r7=27(width), r8=37(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 360
LDI r1, 133
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 337
LDI r6, 145
LDI r7, 27
LDI r8, 37
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
