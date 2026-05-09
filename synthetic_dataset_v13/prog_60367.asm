; DESCRIPTION: Places a magenta 76x55 rectangle at position (163, 14).
; PLAN: r0=163(x), r1=14(y), r2=76(width), r3=55(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 14
LDI r2, 76
LDI r3, 55
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
