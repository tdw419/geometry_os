; DESCRIPTION: Places a green 37x33 rectangle at position (42, 90).
; PLAN: r0=42(x), r1=90(y), r2=37(width), r3=33(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 90
LDI r2, 37
LDI r3, 33
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
