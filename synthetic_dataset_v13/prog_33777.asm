; DESCRIPTION: Composite: Draws a cyan circle centered at (57, 36) with radius 10 then Places a magenta 96x113 rectangle at position (329, 68).
; PLAN: r0=57(x), r1=36(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=329(x), r6=68(y), r7=96(width), r8=113(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 57
LDI r1, 36
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 329
LDI r6, 68
LDI r7, 96
LDI r8, 113
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
