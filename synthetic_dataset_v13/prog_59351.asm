; DESCRIPTION: Creates a magenta rectangular region at (21, 184) spanning 16 by 28 pixels.
; PLAN: r0=21(x), r1=184(y), r2=16(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 184
LDI r2, 16
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
