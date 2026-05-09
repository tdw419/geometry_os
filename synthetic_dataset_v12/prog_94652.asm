; DESCRIPTION: Composite: Renders a green box of size 107x93 starting at (231, 10) then Draws a cyan circle centered at (131, 159) with radius 67.
; PLAN: r0=231(x), r1=10(y), r2=107(width), r3=93(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x), r6=159(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 231
LDI r1, 10
LDI r2, 107
LDI r3, 93
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 159
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
