; DESCRIPTION: Composite: Creates a black circular shape at (106, 133) with radius 40 then Places a white 100x117 rectangle at position (85, 42).
; PLAN: r0=106(x), r1=133(y), r2=40(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=42(y), r7=100(width), r8=117(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 106
LDI r1, 133
LDI r2, 40
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 42
LDI r7, 100
LDI r8, 117
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
