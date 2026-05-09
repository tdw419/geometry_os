; DESCRIPTION: Creates a magenta rectangular region at (431, 39) spanning 65 by 64 pixels.
; PLAN: r0=431(x), r1=39(y), r2=65(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 431
LDI r1, 39
LDI r2, 65
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
