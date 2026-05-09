; DESCRIPTION: Composite: Places a cyan 19x81 rectangle at position (336, 116) then Creates a red circular shape at (478, 146) with radius 34.
; PLAN: r0=336(x), r1=116(y), r2=19(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=478(x), r6=146(y), r7=34(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 336
LDI r1, 116
LDI r2, 19
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 478
LDI r6, 146
LDI r7, 34
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
