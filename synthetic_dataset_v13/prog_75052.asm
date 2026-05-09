; DESCRIPTION: Composite: Creates a red circular shape at (117, 167) with radius 53 then Places a cyan 41x16 rectangle at position (45, 228).
; PLAN: r0=117(x), r1=167(y), r2=53(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=45(x), r6=228(y), r7=41(width), r8=16(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 117
LDI r1, 167
LDI r2, 53
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 45
LDI r6, 228
LDI r7, 41
LDI r8, 16
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
