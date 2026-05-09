; DESCRIPTION: Creates a blue rectangular region at (397, 81) spanning 73 by 42 pixels.
; PLAN: r0=397(x), r1=81(y), r2=73(width), r3=42(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 81
LDI r2, 73
LDI r3, 42
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
