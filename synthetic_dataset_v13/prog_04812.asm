; DESCRIPTION: Creates a white rectangular region at (135, 13) spanning 56 by 35 pixels.
; PLAN: r0=135(x), r1=13(y), r2=56(width), r3=35(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 13
LDI r2, 56
LDI r3, 35
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
