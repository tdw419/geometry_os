; DESCRIPTION: Creates a magenta rectangular region at (157, 173) spanning 21 by 22 pixels.
; PLAN: r0=157(x), r1=173(y), r2=21(width), r3=22(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 173
LDI r2, 21
LDI r3, 22
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
