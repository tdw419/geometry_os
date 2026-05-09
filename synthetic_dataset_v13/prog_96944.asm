; DESCRIPTION: Places a blue 76x63 rectangle at position (25, 14).
; PLAN: r0=25(x), r1=14(y), r2=76(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 14
LDI r2, 76
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
