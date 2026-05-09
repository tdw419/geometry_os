; DESCRIPTION: Places a magenta 45x84 rectangle at position (240, 45).
; PLAN: r0=240(x), r1=45(y), r2=45(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 45
LDI r2, 45
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
