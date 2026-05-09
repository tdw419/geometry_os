; DESCRIPTION: Creates a white rectangular region at (64, 89) spanning 84 by 60 pixels.
; PLAN: r0=64(x), r1=89(y), r2=84(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 89
LDI r2, 84
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
