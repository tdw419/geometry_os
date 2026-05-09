; DESCRIPTION: Composite: Creates a purple circular shape at (213, 134) with radius 58 then Places a white 100x20 rectangle at position (402, 166) then Places a magenta dot at position (47, 213).
; PLAN: r0=213(x), r1=134(y), r2=58(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=402(x), r6=166(y), r7=100(width), r8=20(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=47(x), r11=213(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 213
LDI r1, 134
LDI r2, 58
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 402
LDI r6, 166
LDI r7, 100
LDI r8, 20
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 213
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
