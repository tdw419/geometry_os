; DESCRIPTION: Creates a magenta rectangular region at (244, 143) spanning 65 by 32 pixels.
; PLAN: r0=244(x), r1=143(y), r2=65(width), r3=32(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 143
LDI r2, 65
LDI r3, 32
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
