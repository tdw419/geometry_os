; DESCRIPTION: Creates a yellow rectangular region at (42, 57) spanning 36 by 76 pixels.
; PLAN: r0=42(x), r1=57(y), r2=36(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 57
LDI r2, 36
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
