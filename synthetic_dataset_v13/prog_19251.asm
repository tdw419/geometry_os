; DESCRIPTION: Creates a white rectangular region at (324, 156) spanning 76 by 37 pixels.
; PLAN: r0=324(x), r1=156(y), r2=76(width), r3=37(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 156
LDI r2, 76
LDI r3, 37
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
