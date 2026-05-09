; DESCRIPTION: Creates a magenta rectangular region at (442, 32) spanning 63 by 103 pixels.
; PLAN: r0=442(x), r1=32(y), r2=63(width), r3=103(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 32
LDI r2, 63
LDI r3, 103
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
