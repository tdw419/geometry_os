; DESCRIPTION: Creates a magenta rectangular region at (43, 20) spanning 16 by 89 pixels.
; PLAN: r0=43(x), r1=20(y), r2=16(width), r3=89(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 20
LDI r2, 16
LDI r3, 89
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
