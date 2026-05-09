; DESCRIPTION: Creates a magenta rectangular region at (24, 146) spanning 14 by 82 pixels.
; PLAN: r0=24(x), r1=146(y), r2=14(width), r3=82(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 24
LDI r1, 146
LDI r2, 14
LDI r3, 82
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
