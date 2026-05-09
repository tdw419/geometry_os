; DESCRIPTION: Creates a white rectangular region at (128, 97) spanning 16 by 110 pixels.
; PLAN: r0=128(x), r1=97(y), r2=16(width), r3=110(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 97
LDI r2, 16
LDI r3, 110
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
