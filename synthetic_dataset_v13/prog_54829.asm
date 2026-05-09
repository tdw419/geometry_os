; DESCRIPTION: Creates a white rectangular region at (60, 83) spanning 14 by 64 pixels.
; PLAN: r0=60(x), r1=83(y), r2=14(width), r3=64(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 83
LDI r2, 14
LDI r3, 64
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
