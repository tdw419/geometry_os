; DESCRIPTION: Creates a magenta rectangular region at (189, 100) spanning 32 by 115 pixels.
; PLAN: r0=189(x), r1=100(y), r2=32(width), r3=115(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 100
LDI r2, 32
LDI r3, 115
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
