; DESCRIPTION: Composite: Places a green circle of radius 47 at center (363, 156) then Draws a red rectangle at (387, 33) with width 56 and height 110.
; PLAN: r0=363(x), r1=156(y), r2=47(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=387(x), r6=33(y), r7=56(width), r8=110(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 363
LDI r1, 156
LDI r2, 47
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 387
LDI r6, 33
LDI r7, 56
LDI r8, 110
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
