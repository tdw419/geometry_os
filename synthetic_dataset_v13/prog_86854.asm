; DESCRIPTION: Places a magenta 64x31 rectangle at position (142, 152).
; PLAN: r0=142(x), r1=152(y), r2=64(width), r3=31(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 152
LDI r2, 64
LDI r3, 31
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
