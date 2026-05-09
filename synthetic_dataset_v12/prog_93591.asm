; DESCRIPTION: Composite: Places a yellow 110x19 rectangle at position (82, 206) then Places a magenta circle of radius 77 at center (232, 138).
; PLAN: r0=82(x), r1=206(y), r2=110(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x), r6=138(y), r7=77(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 82
LDI r1, 206
LDI r2, 110
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 138
LDI r7, 77
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
