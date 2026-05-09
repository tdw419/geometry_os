; DESCRIPTION: Composite: Draws a magenta circle centered at (337, 191) with radius 11 then Places a black 44x56 rectangle at position (249, 75).
; PLAN: r0=337(x), r1=191(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=75(y), r7=44(width), r8=56(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 337
LDI r1, 191
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 75
LDI r7, 44
LDI r8, 56
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
