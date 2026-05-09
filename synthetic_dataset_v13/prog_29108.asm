; DESCRIPTION: Composite: Renders a green line between points (378, 165) and (344, 223) then Draws a cyan rectangle at (297, 27) with width 53 and height 14.
; PLAN: r0=378(x1), r1=165(y1), r2=344(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=297(x), r6=27(y), r7=53(width), r8=14(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 378
LDI r1, 165
LDI r2, 344
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 27
LDI r7, 53
LDI r8, 14
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
