; DESCRIPTION: Composite: Places a blue circle of radius 63 at center (297, 118) then Places a purple 45x86 rectangle at position (126, 140).
; PLAN: r0=297(x), r1=118(y), r2=63(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=140(y), r7=45(width), r8=86(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 297
LDI r1, 118
LDI r2, 63
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 140
LDI r7, 45
LDI r8, 86
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
