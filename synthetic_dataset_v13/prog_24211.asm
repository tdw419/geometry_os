; DESCRIPTION: Places a black 17x64 rectangle at position (316, 189).
; PLAN: r0=316(x), r1=189(y), r2=17(width), r3=64(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 316
LDI r1, 189
LDI r2, 17
LDI r3, 64
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
