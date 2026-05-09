; DESCRIPTION: Places a cyan 20x17 rectangle at position (384, 232).
; PLAN: r0=384(x), r1=232(y), r2=20(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 232
LDI r2, 20
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
