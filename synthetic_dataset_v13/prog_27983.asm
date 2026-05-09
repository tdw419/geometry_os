; DESCRIPTION: Composite: Creates a red circular shape at (167, 142) with radius 64 then Places a yellow 88x48 rectangle at position (272, 69).
; PLAN: r0=167(x), r1=142(y), r2=64(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=272(x), r6=69(y), r7=88(width), r8=48(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 142
LDI r2, 64
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 272
LDI r6, 69
LDI r7, 88
LDI r8, 48
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
