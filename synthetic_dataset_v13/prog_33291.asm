; DESCRIPTION: Composite: Places a red circle of radius 27 at center (81, 201) then Draws a white rectangle at (215, 53) with width 52 and height 120.
; PLAN: r0=81(x), r1=201(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=215(x), r6=53(y), r7=52(width), r8=120(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 201
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 215
LDI r6, 53
LDI r7, 52
LDI r8, 120
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
