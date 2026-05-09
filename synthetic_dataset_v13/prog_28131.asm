; DESCRIPTION: Composite: Creates a red circular shape at (212, 119) with radius 15 then Places a purple 70x11 rectangle at position (168, 103).
; PLAN: r0=212(x), r1=119(y), r2=15(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=168(x), r6=103(y), r7=70(width), r8=11(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 212
LDI r1, 119
LDI r2, 15
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 168
LDI r6, 103
LDI r7, 70
LDI r8, 11
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
