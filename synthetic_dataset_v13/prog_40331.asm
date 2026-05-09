; DESCRIPTION: Composite: Creates a blue circular shape at (327, 154) with radius 61 then Places a purple 19x120 rectangle at position (48, 47).
; PLAN: r0=327(x), r1=154(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x), r6=47(y), r7=19(width), r8=120(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 327
LDI r1, 154
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 47
LDI r7, 19
LDI r8, 120
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
