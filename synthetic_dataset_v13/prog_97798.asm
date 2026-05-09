; DESCRIPTION: Composite: Places a yellow 111x83 rectangle at position (110, 173) then Places a black circle of radius 31 at center (370, 158).
; PLAN: r0=110(x), r1=173(y), r2=111(width), r3=83(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x), r6=158(y), r7=31(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 110
LDI r1, 173
LDI r2, 111
LDI r3, 83
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 158
LDI r7, 31
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
