; DESCRIPTION: Places a cyan 19x17 rectangle at position (107, 100).
; PLAN: r0=107(x), r1=100(y), r2=19(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 100
LDI r2, 19
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
