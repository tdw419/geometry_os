; DESCRIPTION: Composite: Draws a cyan circle centered at (155, 122) with radius 15 then Places a purple 63x77 rectangle at position (367, 113).
; PLAN: r0=155(x), r1=122(y), r2=15(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=367(x), r6=113(y), r7=63(width), r8=77(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 155
LDI r1, 122
LDI r2, 15
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 367
LDI r6, 113
LDI r7, 63
LDI r8, 77
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
