; DESCRIPTION: Composite: Draws a black circle centered at (185, 108) with radius 45 then Places a red 111x97 rectangle at position (231, 114).
; PLAN: r0=185(x), r1=108(y), r2=45(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=231(x), r6=114(y), r7=111(width), r8=97(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 185
LDI r1, 108
LDI r2, 45
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 231
LDI r6, 114
LDI r7, 111
LDI r8, 97
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
