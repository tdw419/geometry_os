; DESCRIPTION: Places a magenta 75x75 rectangle at position (219, 76).
; PLAN: r0=219(x), r1=76(y), r2=75(width), r3=75(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 76
LDI r2, 75
LDI r3, 75
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
