; DESCRIPTION: Composite: Places a yellow 71x44 rectangle at position (85, 45) then Draws a cyan circle centered at (67, 56) with radius 32.
; PLAN: r0=85(x), r1=45(y), r2=71(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=67(x), r6=56(y), r7=32(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 85
LDI r1, 45
LDI r2, 71
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 56
LDI r7, 32
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
