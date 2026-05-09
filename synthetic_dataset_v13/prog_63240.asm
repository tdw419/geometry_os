; DESCRIPTION: Composite: Creates a green circular shape at (314, 192) with radius 30 then Places a purple 94x110 rectangle at position (308, 60).
; PLAN: r0=314(x), r1=192(y), r2=30(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=308(x), r6=60(y), r7=94(width), r8=110(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 314
LDI r1, 192
LDI r2, 30
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 308
LDI r6, 60
LDI r7, 94
LDI r8, 110
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
