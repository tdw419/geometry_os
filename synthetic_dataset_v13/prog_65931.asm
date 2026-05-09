; DESCRIPTION: Places a black 49x36 rectangle at position (217, 139).
; PLAN: r0=217(x), r1=139(y), r2=49(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 139
LDI r2, 49
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
