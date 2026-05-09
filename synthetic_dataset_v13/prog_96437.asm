; DESCRIPTION: Creates a white rectangular region at (329, 64) spanning 21 by 99 pixels.
; PLAN: r0=329(x), r1=64(y), r2=21(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 64
LDI r2, 21
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
