; DESCRIPTION: Creates a blue rectangular region at (53, 42) spanning 75 by 100 pixels.
; PLAN: r0=53(x), r1=42(y), r2=75(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 42
LDI r2, 75
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
