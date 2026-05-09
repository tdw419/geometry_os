; DESCRIPTION: Creates a yellow rectangular region at (381, 156) spanning 42 by 49 pixels.
; PLAN: r0=381(x), r1=156(y), r2=42(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 156
LDI r2, 42
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
