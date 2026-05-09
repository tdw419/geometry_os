; DESCRIPTION: Creates a yellow rectangular region at (122, 11) spanning 42 by 37 pixels.
; PLAN: r0=122(x), r1=11(y), r2=42(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 11
LDI r2, 42
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
