; DESCRIPTION: Places a magenta 13x23 rectangle at position (256, 12).
; PLAN: r0=256(x), r1=12(y), r2=13(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 12
LDI r2, 13
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
