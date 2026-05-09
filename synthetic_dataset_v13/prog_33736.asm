; DESCRIPTION: Composite: Draws a white rectangle at (358, 21) with width 54 and height 107 then Places a red line segment connecting (238, 156) to (256, 118).
; PLAN: r0=358(x), r1=21(y), r2=54(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=238(x1), r6=156(y1), r7=256(x2), r8=118(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 358
LDI r1, 21
LDI r2, 54
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 238
LDI r6, 156
LDI r7, 256
LDI r8, 118
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
