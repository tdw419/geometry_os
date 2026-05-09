; DESCRIPTION: Places a magenta 24x69 rectangle at position (240, 69).
; PLAN: r0=240(x), r1=69(y), r2=24(width), r3=69(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 69
LDI r2, 24
LDI r3, 69
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
