; DESCRIPTION: Composite: Places a red line segment connecting (448, 142) to (408, 182) then Draws a green rectangle at (239, 165) with width 40 and height 83.
; PLAN: r0=448(x1), r1=142(y1), r2=408(x2), r3=182(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=239(x), r6=165(y), r7=40(width), r8=83(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 448
LDI r1, 142
LDI r2, 408
LDI r3, 182
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 165
LDI r7, 40
LDI r8, 83
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
