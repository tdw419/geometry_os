; DESCRIPTION: Places a green 29x32 rectangle at position (19, 170).
; PLAN: r0=19(x), r1=170(y), r2=29(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 170
LDI r2, 29
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
