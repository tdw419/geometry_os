; DESCRIPTION: Composite: Renders a cyan disk with center (62, 24) and radius 16 then Places a red 53x45 rectangle at position (136, 69).
; PLAN: r0=62(x), r1=24(y), r2=16(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=136(x), r6=69(y), r7=53(width), r8=45(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 62
LDI r1, 24
LDI r2, 16
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 136
LDI r6, 69
LDI r7, 53
LDI r8, 45
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
