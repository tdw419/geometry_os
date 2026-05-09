; DESCRIPTION: Composite: Draws a yellow circle centered at (192, 135) with radius 60 then Places a white 57x42 rectangle at position (8, 158).
; PLAN: r0=192(x), r1=135(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=8(x), r6=158(y), r7=57(width), r8=42(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 192
LDI r1, 135
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 8
LDI r6, 158
LDI r7, 57
LDI r8, 42
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
