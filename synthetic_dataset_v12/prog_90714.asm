; DESCRIPTION: Composite: Places a cyan circle of radius 50 at center (101, 150) then Places a purple 38x107 rectangle at position (418, 108).
; PLAN: r0=101(x), r1=150(y), r2=50(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=418(x), r6=108(y), r7=38(width), r8=107(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 101
LDI r1, 150
LDI r2, 50
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 418
LDI r6, 108
LDI r7, 38
LDI r8, 107
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
