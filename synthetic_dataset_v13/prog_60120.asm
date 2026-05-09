; DESCRIPTION: Places a green 42x69 rectangle at position (424, 130).
; PLAN: r0=424(x), r1=130(y), r2=42(width), r3=69(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 130
LDI r2, 42
LDI r3, 69
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
