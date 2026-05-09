; DESCRIPTION: Composite: Creates a orange circular shape at (21, 140) with radius 17 then Places a purple 82x61 rectangle at position (267, 47).
; PLAN: r0=21(x), r1=140(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=267(x), r6=47(y), r7=82(width), r8=61(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 21
LDI r1, 140
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 267
LDI r6, 47
LDI r7, 82
LDI r8, 61
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
