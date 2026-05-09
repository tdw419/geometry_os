; DESCRIPTION: Composite: Draws a magenta rectangle at (13, 48) with width 16 and height 93 then Places a green dot at position (201, 18).
; PLAN: r0=13(x), r1=48(y), r2=16(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=201(x), r6=18(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 13
LDI r1, 48
LDI r2, 16
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 201
LDI r6, 18
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
