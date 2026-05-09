; DESCRIPTION: Creates a magenta rectangular region at (30, 165) spanning 16 by 21 pixels.
; PLAN: r0=30(x), r1=165(y), r2=16(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 165
LDI r2, 16
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
