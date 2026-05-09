; DESCRIPTION: Creates a yellow rectangular region at (413, 198) spanning 62 by 42 pixels.
; PLAN: r0=413(x), r1=198(y), r2=62(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 198
LDI r2, 62
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
