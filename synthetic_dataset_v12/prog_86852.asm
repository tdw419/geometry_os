; DESCRIPTION: Composite: Places a blue 76x32 rectangle at position (44, 126) then Creates a magenta circular shape at (245, 59) with radius 39.
; PLAN: r0=44(x), r1=126(y), r2=76(width), r3=32(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=245(x), r6=59(y), r7=39(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 44
LDI r1, 126
LDI r2, 76
LDI r3, 32
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 245
LDI r6, 59
LDI r7, 39
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
