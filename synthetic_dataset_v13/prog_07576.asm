; DESCRIPTION: Creates a magenta rectangular region at (315, 83) spanning 37 by 63 pixels.
; PLAN: r0=315(x), r1=83(y), r2=37(width), r3=63(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 315
LDI r1, 83
LDI r2, 37
LDI r3, 63
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
