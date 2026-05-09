; DESCRIPTION: Creates a yellow rectangular region at (42, 78) spanning 30 by 22 pixels.
; PLAN: r0=42(x), r1=78(y), r2=30(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 78
LDI r2, 30
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
