; DESCRIPTION: Creates a white rectangular region at (6, 54) spanning 64 by 11 pixels.
; PLAN: r0=6(x), r1=54(y), r2=64(width), r3=11(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 54
LDI r2, 64
LDI r3, 11
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
