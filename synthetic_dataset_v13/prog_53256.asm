; DESCRIPTION: Creates a yellow rectangular region at (42, 1) spanning 20 by 30 pixels.
; PLAN: r0=42(x), r1=1(y), r2=20(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 1
LDI r2, 20
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
