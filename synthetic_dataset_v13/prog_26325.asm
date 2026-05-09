; DESCRIPTION: Composite: Places a red line segment connecting (299, 2) to (64, 163) then Draws a cyan rectangle at (62, 13) with width 89 and height 23.
; PLAN: r0=299(x1), r1=2(y1), r2=64(x2), r3=163(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=62(x), r6=13(y), r7=89(width), r8=23(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 299
LDI r1, 2
LDI r2, 64
LDI r3, 163
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 13
LDI r7, 89
LDI r8, 23
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
