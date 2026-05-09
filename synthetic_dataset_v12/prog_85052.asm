; DESCRIPTION: Places a cyan 81x69 rectangle at position (318, 49).
; PLAN: r0=318(x), r1=49(y), r2=81(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 49
LDI r2, 81
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
