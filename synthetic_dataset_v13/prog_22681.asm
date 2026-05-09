; DESCRIPTION: Places a magenta 119x32 rectangle at position (256, 55).
; PLAN: r0=256(x), r1=55(y), r2=119(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 55
LDI r2, 119
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
