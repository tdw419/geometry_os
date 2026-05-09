; DESCRIPTION: Composite: Places a black 16x64 rectangle at position (102, 184) then Places a blue circle of radius 21 at center (189, 99).
; PLAN: r0=102(x), r1=184(y), r2=16(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=189(x), r6=99(y), r7=21(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 102
LDI r1, 184
LDI r2, 16
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 189
LDI r6, 99
LDI r7, 21
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
