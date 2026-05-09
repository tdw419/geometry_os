; DESCRIPTION: Creates a magenta rectangular region at (367, 106) spanning 68 by 64 pixels.
; PLAN: r0=367(x), r1=106(y), r2=68(width), r3=64(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 106
LDI r2, 68
LDI r3, 64
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
