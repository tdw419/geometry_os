; DESCRIPTION: Places a blue 92x107 rectangle at position (360, 69).
; PLAN: r0=360(x), r1=69(y), r2=92(width), r3=107(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 69
LDI r2, 92
LDI r3, 107
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
