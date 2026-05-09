; DESCRIPTION: Creates a magenta rectangular region at (0, 27) spanning 82 by 61 pixels.
; PLAN: r0=0(x), r1=27(y), r2=82(width), r3=61(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 27
LDI r2, 82
LDI r3, 61
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
