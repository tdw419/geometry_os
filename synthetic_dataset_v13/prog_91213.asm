; DESCRIPTION: Composite: Creates a white circular shape at (117, 168) with radius 74 then Places a black 107x10 rectangle at position (216, 153).
; PLAN: r0=117(x), r1=168(y), r2=74(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=216(x), r6=153(y), r7=107(width), r8=10(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 168
LDI r2, 74
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 216
LDI r6, 153
LDI r7, 107
LDI r8, 10
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
