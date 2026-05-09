; DESCRIPTION: Creates a magenta rectangular region at (432, 103) spanning 76 by 42 pixels.
; PLAN: r0=432(x), r1=103(y), r2=76(width), r3=42(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 103
LDI r2, 76
LDI r3, 42
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
