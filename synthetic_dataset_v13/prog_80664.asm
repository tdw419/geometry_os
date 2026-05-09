; DESCRIPTION: Creates a magenta rectangular region at (86, 72) spanning 45 by 110 pixels.
; PLAN: r0=86(x), r1=72(y), r2=45(width), r3=110(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 72
LDI r2, 45
LDI r3, 110
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
