; DESCRIPTION: Creates a yellow rectangular region at (184, 224) spanning 54 by 32 pixels.
; PLAN: r0=184(x), r1=224(y), r2=54(width), r3=32(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 184
LDI r1, 224
LDI r2, 54
LDI r3, 32
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
