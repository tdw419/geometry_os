; DESCRIPTION: Composite: Creates a cyan circular shape at (445, 100) with radius 64 then Places a purple 37x72 rectangle at position (161, 34).
; PLAN: r0=445(x), r1=100(y), r2=64(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x), r6=34(y), r7=37(width), r8=72(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 445
LDI r1, 100
LDI r2, 64
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 34
LDI r7, 37
LDI r8, 72
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
