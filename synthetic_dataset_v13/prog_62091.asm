; DESCRIPTION: Creates a magenta rectangular region at (351, 190) spanning 40 by 58 pixels.
; PLAN: r0=351(x), r1=190(y), r2=40(width), r3=58(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 351
LDI r1, 190
LDI r2, 40
LDI r3, 58
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
