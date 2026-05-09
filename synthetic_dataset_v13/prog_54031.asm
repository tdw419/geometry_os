; DESCRIPTION: Places a green 105x69 rectangle at position (42, 170).
; PLAN: r0=42(x), r1=170(y), r2=105(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 170
LDI r2, 105
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
