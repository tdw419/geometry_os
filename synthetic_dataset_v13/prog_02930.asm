; DESCRIPTION: Places a magenta 64x37 rectangle at position (130, 35).
; PLAN: r0=130(x), r1=35(y), r2=64(width), r3=37(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 35
LDI r2, 64
LDI r3, 37
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
