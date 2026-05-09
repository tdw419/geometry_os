; DESCRIPTION: Composite: Creates a cyan circular shape at (55, 55) with radius 46 then Places a purple 50x58 rectangle at position (5, 74).
; PLAN: r0=55(x), r1=55(y), r2=46(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=5(x), r6=74(y), r7=50(width), r8=58(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 55
LDI r2, 46
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 5
LDI r6, 74
LDI r7, 50
LDI r8, 58
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
