; DESCRIPTION: Creates a white rectangular region at (52, 128) spanning 33 by 97 pixels.
; PLAN: r0=52(x), r1=128(y), r2=33(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 128
LDI r2, 33
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
