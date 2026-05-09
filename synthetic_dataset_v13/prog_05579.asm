; DESCRIPTION: Places a blue 60x101 rectangle at position (242, 69).
; PLAN: r0=242(x), r1=69(y), r2=60(width), r3=101(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 69
LDI r2, 60
LDI r3, 101
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
