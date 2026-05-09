; DESCRIPTION: Creates a blue rectangular region at (309, 156) spanning 72 by 61 pixels.
; PLAN: r0=309(x), r1=156(y), r2=72(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 156
LDI r2, 72
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
