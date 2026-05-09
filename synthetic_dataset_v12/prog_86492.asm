; DESCRIPTION: Places a cyan 49x115 rectangle at position (253, 2).
; PLAN: r0=253(x), r1=2(y), r2=49(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 2
LDI r2, 49
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
