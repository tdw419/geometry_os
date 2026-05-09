; DESCRIPTION: Composite: Creates a white circular shape at (164, 57) with radius 23 then Places a magenta 98x17 rectangle at position (165, 117).
; PLAN: r0=164(x), r1=57(y), r2=23(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=165(x), r6=117(y), r7=98(width), r8=17(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 164
LDI r1, 57
LDI r2, 23
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 165
LDI r6, 117
LDI r7, 98
LDI r8, 17
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
