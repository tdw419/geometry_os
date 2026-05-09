; DESCRIPTION: Composite: Creates a white circular shape at (423, 169) with radius 14 then Places a cyan 61x118 rectangle at position (214, 71).
; PLAN: r0=423(x), r1=169(y), r2=14(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=214(x), r6=71(y), r7=61(width), r8=118(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 423
LDI r1, 169
LDI r2, 14
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 214
LDI r6, 71
LDI r7, 61
LDI r8, 118
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
