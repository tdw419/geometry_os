; DESCRIPTION: Composite: Creates a red circular shape at (456, 211) with radius 45 then Places a cyan 73x68 rectangle at position (418, 85).
; PLAN: r0=456(x), r1=211(y), r2=45(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=418(x), r6=85(y), r7=73(width), r8=68(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 456
LDI r1, 211
LDI r2, 45
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 418
LDI r6, 85
LDI r7, 73
LDI r8, 68
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
