; DESCRIPTION: Composite: Draws a green circle centered at (156, 58) with radius 10 then Draws a red rectangle at (250, 80) with width 63 and height 45.
; PLAN: r0=156(x), r1=58(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=250(x), r6=80(y), r7=63(width), r8=45(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 156
LDI r1, 58
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 250
LDI r6, 80
LDI r7, 63
LDI r8, 45
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
