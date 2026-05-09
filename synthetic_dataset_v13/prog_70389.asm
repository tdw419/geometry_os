; DESCRIPTION: Composite: Places a magenta 66x89 rectangle at position (394, 130) then Draws a cyan circle centered at (372, 157) with radius 44.
; PLAN: r0=394(x), r1=130(y), r2=66(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x), r6=157(y), r7=44(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 394
LDI r1, 130
LDI r2, 66
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 157
LDI r7, 44
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
