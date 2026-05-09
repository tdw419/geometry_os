; DESCRIPTION: Composite: Draws a red circle centered at (81, 74) with radius 13 then Places a red 73x104 rectangle at position (142, 66).
; PLAN: r0=81(x), r1=74(y), r2=13(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=142(x), r6=66(y), r7=73(width), r8=104(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 81
LDI r1, 74
LDI r2, 13
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 142
LDI r6, 66
LDI r7, 73
LDI r8, 104
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
