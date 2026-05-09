; DESCRIPTION: Creates a magenta rectangular region at (291, 4) spanning 110 by 16 pixels.
; PLAN: r0=291(x), r1=4(y), r2=110(width), r3=16(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 4
LDI r2, 110
LDI r3, 16
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
