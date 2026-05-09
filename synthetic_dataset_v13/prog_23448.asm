; DESCRIPTION: Creates a white rectangular region at (286, 63) spanning 88 by 64 pixels.
; PLAN: r0=286(x), r1=63(y), r2=88(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 63
LDI r2, 88
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
