; DESCRIPTION: Composite: Places a white 111x81 rectangle at position (87, 114) then Creates a magenta circular shape at (79, 161) with radius 19.
; PLAN: r0=87(x), r1=114(y), r2=111(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x), r6=161(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 87
LDI r1, 114
LDI r2, 111
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 161
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
