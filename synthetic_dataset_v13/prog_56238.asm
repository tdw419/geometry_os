; DESCRIPTION: Composite: Creates a white circular shape at (326, 85) with radius 45 then Sets a single cyan pixel at (168, 74) then Places a black 102x23 rectangle at position (284, 159).
; PLAN: r0=326(x), r1=85(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=168(x), r6=74(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=284(x), r11=159(y), r12=102(width), r13=23(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 326
LDI r1, 85
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 168
LDI r6, 74
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 284
LDI r11, 159
LDI r12, 102
LDI r13, 23
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
