; DESCRIPTION: Composite: Draws a white rectangle at (284, 85) with width 60 and height 106 then Renders a green line between points (172, 167) and (459, 103).
; PLAN: r0=284(x), r1=85(y), r2=60(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=172(x1), r6=167(y1), r7=459(x2), r8=103(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 284
LDI r1, 85
LDI r2, 60
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 172
LDI r6, 167
LDI r7, 459
LDI r8, 103
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
