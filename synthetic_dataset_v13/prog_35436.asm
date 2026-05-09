; DESCRIPTION: Composite: Draws a red circle centered at (445, 192) with radius 45 then Places a purple 76x23 rectangle at position (120, 194).
; PLAN: r0=445(x), r1=192(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=120(x), r6=194(y), r7=76(width), r8=23(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 445
LDI r1, 192
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 120
LDI r6, 194
LDI r7, 76
LDI r8, 23
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
