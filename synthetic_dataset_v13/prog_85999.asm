; DESCRIPTION: Composite: Draws a black circle centered at (51, 74) with radius 47 then Places a yellow 32x99 rectangle at position (13, 15).
; PLAN: r0=51(x), r1=74(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=13(x), r6=15(y), r7=32(width), r8=99(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 51
LDI r1, 74
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 13
LDI r6, 15
LDI r7, 32
LDI r8, 99
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
