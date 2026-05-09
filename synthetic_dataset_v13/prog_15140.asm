; DESCRIPTION: Composite: Places a red circle of radius 30 at center (173, 158) then Draws a white rectangle at (284, 93) with width 85 and height 65.
; PLAN: r0=173(x), r1=158(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x), r6=93(y), r7=85(width), r8=65(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 173
LDI r1, 158
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 93
LDI r7, 85
LDI r8, 65
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
