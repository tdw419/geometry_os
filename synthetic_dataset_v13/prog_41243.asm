; DESCRIPTION: Composite: Places a green 71x113 rectangle at position (68, 56) then Creates a magenta circular shape at (422, 98) with radius 47.
; PLAN: r0=68(x), r1=56(y), r2=71(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x), r6=98(y), r7=47(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 68
LDI r1, 56
LDI r2, 71
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 98
LDI r7, 47
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
