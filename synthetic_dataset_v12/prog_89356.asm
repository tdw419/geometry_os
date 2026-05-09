; DESCRIPTION: Composite: Places a green 90x62 rectangle at position (358, 32) then Places a purple circle of radius 61 at center (93, 160).
; PLAN: r0=358(x), r1=32(y), r2=90(width), r3=62(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=93(x), r6=160(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 358
LDI r1, 32
LDI r2, 90
LDI r3, 62
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 93
LDI r6, 160
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
