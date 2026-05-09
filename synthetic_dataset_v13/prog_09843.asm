; DESCRIPTION: Composite: Renders a green disk with center (490, 53) and radius 16 then Places a black 22x78 rectangle at position (225, 66).
; PLAN: r0=490(x), r1=53(y), r2=16(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=225(x), r6=66(y), r7=22(width), r8=78(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 490
LDI r1, 53
LDI r2, 16
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 225
LDI r6, 66
LDI r7, 22
LDI r8, 78
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
