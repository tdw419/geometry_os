; DESCRIPTION: Places a green 42x26 rectangle at position (161, 90).
; PLAN: r0=161(x), r1=90(y), r2=42(width), r3=26(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 90
LDI r2, 42
LDI r3, 26
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
