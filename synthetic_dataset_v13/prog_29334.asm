; DESCRIPTION: Places a blue 58x100 rectangle at position (139, 40).
; PLAN: r0=139(x), r1=40(y), r2=58(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 40
LDI r2, 58
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
