; DESCRIPTION: Composite: Creates a purple circular shape at (435, 214) with radius 37 then Places a purple 98x74 rectangle at position (55, 37).
; PLAN: r0=435(x), r1=214(y), r2=37(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x), r6=37(y), r7=98(width), r8=74(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 435
LDI r1, 214
LDI r2, 37
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 37
LDI r7, 98
LDI r8, 74
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
