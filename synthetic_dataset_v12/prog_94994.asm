; DESCRIPTION: Composite: Places a red 19x104 rectangle at position (19, 145) then Places a white circle of radius 41 at center (297, 183).
; PLAN: r0=19(x), r1=145(y), r2=19(width), r3=104(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=297(x), r6=183(y), r7=41(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 19
LDI r1, 145
LDI r2, 19
LDI r3, 104
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 297
LDI r6, 183
LDI r7, 41
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
