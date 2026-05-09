; DESCRIPTION: Places a blue 32x76 rectangle at position (166, 47).
; PLAN: r0=166(x), r1=47(y), r2=32(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 47
LDI r2, 32
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
