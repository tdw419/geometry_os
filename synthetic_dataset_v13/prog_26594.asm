; DESCRIPTION: Creates a magenta rectangular region at (83, 15) spanning 16 by 85 pixels.
; PLAN: r0=83(x), r1=15(y), r2=16(width), r3=85(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 15
LDI r2, 16
LDI r3, 85
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
