; DESCRIPTION: Creates a magenta rectangular region at (394, 0) spanning 43 by 63 pixels.
; PLAN: r0=394(x), r1=0(y), r2=43(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 0
LDI r2, 43
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
