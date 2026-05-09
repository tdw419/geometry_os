; DESCRIPTION: Composite: Places a black 82x28 rectangle at position (396, 39) then Draws a green circle centered at (365, 95) with radius 47.
; PLAN: r0=396(x), r1=39(y), r2=82(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=365(x), r6=95(y), r7=47(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 396
LDI r1, 39
LDI r2, 82
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 365
LDI r6, 95
LDI r7, 47
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
