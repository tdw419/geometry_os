; DESCRIPTION: Creates a magenta rectangular region at (351, 79) spanning 45 by 84 pixels.
; PLAN: r0=351(x), r1=79(y), r2=45(width), r3=84(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 79
LDI r2, 45
LDI r3, 84
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
