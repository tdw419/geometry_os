; DESCRIPTION: Composite: Places a magenta 23x96 rectangle at position (257, 98) then Draws a black line from (182, 105) to (375, 255).
; PLAN: r0=257(x), r1=98(y), r2=23(width), r3=96(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x1), r6=105(y1), r7=375(x2), r8=255(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 257
LDI r1, 98
LDI r2, 23
LDI r3, 96
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 105
LDI r7, 375
LDI r8, 255
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
