; DESCRIPTION: Composite: Places a cyan 51x17 rectangle at position (379, 128) then Places a magenta circle of radius 70 at center (300, 101).
; PLAN: r0=379(x), r1=128(y), r2=51(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=300(x), r6=101(y), r7=70(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 379
LDI r1, 128
LDI r2, 51
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 300
LDI r6, 101
LDI r7, 70
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
