; DESCRIPTION: Creates a yellow rectangular region at (128, 13) spanning 20 by 42 pixels.
; PLAN: r0=128(x), r1=13(y), r2=20(width), r3=42(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 13
LDI r2, 20
LDI r3, 42
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
