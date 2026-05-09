; DESCRIPTION: Creates a white rectangular region at (56, 173) spanning 63 by 62 pixels.
; PLAN: r0=56(x), r1=173(y), r2=63(width), r3=62(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 173
LDI r2, 63
LDI r3, 62
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
